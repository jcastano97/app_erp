import 'package:drift/drift.dart';

import 'company_table.dart';
import 'contact_table.dart';

@DataClassName("Client")
class ClientTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get contact => integer().references(ContactTable, #id)();
  IntColumn? get company =>
      integer().nullable().references(CompanyTable, #id)();
  DateTimeColumn? get createdAt => dateTime().nullable()();
}
