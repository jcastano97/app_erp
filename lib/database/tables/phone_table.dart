import 'package:drift/drift.dart';

import 'country_table.dart';

@DataClassName("Phone")
class PhoneTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get number => text().unique()();
  IntColumn? get country =>
      integer().nullable().references(CountryTable, #id)();
}
