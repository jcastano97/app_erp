import 'package:app/database/database.dart';
import 'package:app/database/tables/inventory_item_table.dart';
import 'package:drift/drift.dart';

part 'inventory_item_dao.g.dart';

@DriftAccessor(tables: [InventoryItemTable])
class InventoryItemDao extends DatabaseAccessor<AppDatabase>
    with _$InventoryItemDaoMixin {
  InventoryItemDao(super.db);

  Future<List<InventoryItemTableData>> getAll() {
    return select(db.inventoryItemTable).get();
  }

  Future<int> insertOne(InventoryItemTableCompanion inventoryItem) {
    return into(db.inventoryItemTable).insert(inventoryItem);
  }

  Future<bool> updateOne(InventoryItemTableData inventoryItem) {
    return update(db.inventoryItemTable).replace(inventoryItem);
  }

  Future<int> deleteOne(InventoryItemTableData inventoryItem) {
    return delete(db.inventoryItemTable).delete(inventoryItem);
  }
}
