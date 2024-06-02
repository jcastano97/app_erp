import 'package:drift/drift.dart';

class ViewTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn? get name => text().nullable()();
  TextColumn get route => text()();
}
