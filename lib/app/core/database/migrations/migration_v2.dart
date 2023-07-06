import 'package:flutter_todo_br/app/core/database/migrations/migration.dart';
import 'package:sqflite_common/sqlite_api.dart';

class MigrationV2 implements Migration {
  @override
  void create(Batch batch) {
    batch.execute('''
      create table teste(
        id Integer primary key autoincrement,
      )
''');
  }

  @override
  void update(Batch batch) {
    batch.execute('''
      create table teste(
        id Integer primary key autoincrement,
      )
''');
  }
}