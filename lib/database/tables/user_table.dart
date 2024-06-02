import 'package:drift/drift.dart';

import 'contact_table.dart';

class UserTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get username => text()();
  IntColumn? get contact =>
      integer().nullable().references(ContactTable, #id)();
  DateTimeColumn? get createdAt => dateTime().nullable()();
  DateTimeColumn? get updatedAt => dateTime().nullable()();
}
