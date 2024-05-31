import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:drift_dev/api/migrations.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

import 'tables/address_table.dart';
import 'tables/api_method_table.dart';
import 'tables/api_table.dart';
import 'tables/client_table.dart';
import 'tables/company_table.dart';
import 'tables/contact_table.dart';
import 'tables/country_table.dart';
import 'tables/employee_table.dart';
import 'tables/inventory_item_order_table.dart';
import 'tables/inventory_item_table.dart';
import 'tables/order_table.dart';
import 'tables/permission_role_table.dart';
import 'tables/permission_table.dart';
import 'tables/phone_table.dart';
import 'tables/provider_table.dart';
import 'tables/role_table.dart';
import 'tables/user_table.dart';
import 'tables/view_table.dart';

part 'database.g.dart';

@DriftDatabase(tables: [
  AddressTable,
  ApiMethodTable,
  ApiTable,
  ClientTable,
  CompanyTable,
  ContactTable,
  CountryTable,
  EmployeeTable,
  InventoryItemOrderTable,
  InventoryItemTable,
  OrderTable,
  PermissionRoleTable,
  PermissionTable,
  PhoneTable,
  ProviderTable,
  RoleTable,
  UserTable,
  ViewTable
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        m.createAll();
      },
      onUpgrade: (m, from, to) async {
        await customStatement('PRAGMA foreign_keys = OFF');
        // create missing tables that were missing in version 1
        if (from <= 1) {
          await m.createTable(addressTable);
          await m.createTable(apiMethodTable);
          await m.createTable(apiTable);
          await m.createTable(clientTable);
          await m.createTable(companyTable);
          await m.createTable(contactTable);
          await m.createTable(countryTable);
        }
      },
      beforeOpen: (details) async {
        await customStatement('PRAGMA foreign_keys = ON');
        await validateDatabaseSchema();
      },
    );
  }

  Future<void> deleteEverything() async {
    await customStatement('PRAGMA foreign_keys = OFF');
    try {
      await transaction(() async {
        for (final table in allTables) {
          try {
            await delete(table).go();
          } catch (e) {
            print(e);
          }
        }
      });
    } finally {
      await customStatement('PRAGMA foreign_keys = ON');
    }
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    final cachebase = (await getTemporaryDirectory()).path;
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}
