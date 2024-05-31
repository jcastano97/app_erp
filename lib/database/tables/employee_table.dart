import 'package:drift/drift.dart';

import 'contact_table.dart';

@DataClassName("Employee")
class EmployeeTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get contact => integer().references(ContactTable, #id)();
  DateTimeColumn? get createdAt => dateTime().nullable()();
}
