import 'package:flutter_todo_br/app/core/database/migrations/migration.dart';
import 'package:sqflite_common/sqlite_api.dart';

class MigrationV3 implements Migration {
  @override
  void create(Batch batch) {
    batch.execute('''
      create table teste2(
        id Integer primary key autoincrement,
      )
''');
  }

  @override
  void update(Batch batch) {
    batch.execute('''
      create table teste2(
        id Integer primary key autoincrement,
      )
''');
  }
}
