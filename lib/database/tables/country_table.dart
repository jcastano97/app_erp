import 'package:drift/drift.dart';

@DataClassName("Country")
class CountryTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn? get code => text().nullable().withLength(min: 2, max: 3)();
  TextColumn? get extension => text().nullable().withLength(min: 2, max: 3)();
}
