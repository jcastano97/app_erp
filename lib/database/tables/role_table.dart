import 'package:drift/drift.dart';

class RoleTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
}
