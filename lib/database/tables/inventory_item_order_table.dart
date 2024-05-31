import 'package:drift/drift.dart';

import 'inventory_item_table.dart';
import 'order_table.dart';

@DataClassName("InventoryItemOrder")
class InventoryItemOrderTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn? get date => dateTime().nullable()();
  IntColumn get quantity => integer()();
  IntColumn? get order => integer().nullable().references(OrderTable, #id)();
  IntColumn? get inventoryItem =>
      integer().nullable().references(InventoryItemTable, #id)();
  DateTimeColumn? get createdAt => dateTime().nullable()();
  DateTimeColumn? get updatedAt => dateTime().nullable()();
}
