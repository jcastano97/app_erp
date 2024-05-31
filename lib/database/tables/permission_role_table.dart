import 'package:drift/drift.dart';

import 'permission_table.dart';
import 'role_table.dart';

@DataClassName("PermissionRole")
class PermissionRoleTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get permission => integer().references(PermissionTable, #id)();
  IntColumn get role => integer().references(RoleTable, #id)();
}
