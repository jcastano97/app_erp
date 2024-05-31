import 'package:drift/drift.dart';

import 'api_table.dart';
import 'view_table.dart';

@DataClassName("Permission")
class PermissionTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn? get name => text().nullable()();
  IntColumn? get view => integer().nullable().references(ViewTable, #id)();
  IntColumn? get api => integer().nullable().references(ApiTable, #id)();
}
