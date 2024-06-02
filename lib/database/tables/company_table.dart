import 'package:app/database/tables/address_table.dart';
import 'package:app/database/tables/phone_table.dart';
import 'package:drift/drift.dart';

class CompanyTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn? get email => text().nullable()();
  IntColumn? get phone => integer().nullable().references(PhoneTable, #id)();
  IntColumn? get address =>
      integer().nullable().references(AddressTable, #id)();
  DateTimeColumn? get createdAt => dateTime().nullable()();
  DateTimeColumn? get updatedAt => dateTime().nullable()();
}
