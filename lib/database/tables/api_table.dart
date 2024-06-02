import 'package:drift/drift.dart';

import 'api_method_table.dart';

class ApiTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn? get description => text().nullable()();
  TextColumn get route => text()();
  IntColumn get method => integer().references(ApiMethodTable, #id)();
}
