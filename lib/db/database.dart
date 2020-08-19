import 'dart:async';
import 'package:floor/floor.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dao/person_dao.dart';
import 'entity/person.dart';

part 'database.g.dart'; //run cmd: flutter packages pub run build_runner build


@Database(version: 4, entities: [Person])
abstract class AppDatabase extends FloorDatabase {
  PersonDao get personDao;
//  UserDao get userDao;
}
