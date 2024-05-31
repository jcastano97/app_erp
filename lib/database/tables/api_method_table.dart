import 'package:drift/drift.dart';

@DataClassName("ApiMethod")
class ApiMethodTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
}
