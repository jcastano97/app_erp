import 'package:drift/drift.dart';

import 'address_table.dart';
import 'phone_table.dart';

class ContactTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn? get firstName => text().nullable()();
  TextColumn? get lastName => text().nullable()();
  TextColumn? get email => text().nullable()();
  IntColumn? get phone => integer().nullable().references(PhoneTable, #id)();
  IntColumn? get address =>
      integer().nullable().references(AddressTable, #id)();
  DateTimeColumn? get createdAt => dateTime().nullable()();
  DateTimeColumn? get updatedAt => dateTime().nullable()();
}
