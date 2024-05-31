import 'package:drift/drift.dart';

import 'client_table.dart';
import 'employee_table.dart';

@DataClassName("Order")
class OrderTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn? get date => dateTime().nullable()();
  IntColumn get quantity => integer()();
  TextColumn get total => text()();
  TextColumn? get taxes => text().nullable()();
  TextColumn get status => text()();
  TextColumn get type => text()();
  IntColumn? get client => integer().nullable().references(ClientTable, #id)();
  IntColumn? get employee =>
      integer().nullable().references(EmployeeTable, #id)();
  DateTimeColumn? get createdAt => dateTime().nullable()();
  DateTimeColumn? get updatedAt => dateTime().nullable()();
}
