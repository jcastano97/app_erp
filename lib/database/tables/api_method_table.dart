import 'package:drift/drift.dart';

class ApiMethodTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
}
