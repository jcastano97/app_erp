import 'package:drift/drift.dart';

import 'country_table.dart';

@DataClassName("Address")
class AddressTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get address => text()();
  TextColumn? get city => text().nullable()();
  TextColumn? get state => text().nullable()();
  IntColumn? get country =>
      integer().nullable().references(CountryTable, #id)();
}
