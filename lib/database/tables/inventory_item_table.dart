import 'package:drift/drift.dart';

class InventoryItemTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 2, max: 255)();
  TextColumn? get description => text().nullable()();
  IntColumn get quantity => integer().withDefault(const Constant(0))();
  TextColumn? get quantityFactor => text().nullable()();
  TextColumn? get purchasePrice => text().nullable()();
  TextColumn? get sellPrice => text().nullable()();
  TextColumn? get currencyPrice => text().nullable()();
  DateTimeColumn? get createdAt => dateTime().nullable()();
  DateTimeColumn? get updatedAt => dateTime().nullable()();
}
