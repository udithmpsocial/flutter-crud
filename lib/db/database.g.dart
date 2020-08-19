// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? join(await sqflite.getDatabasesPath(), name)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  PersonDao _personDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    return sqflite.openDatabase(
      path,
      version: 4,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Person` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `serial` TEXT, `fname` TEXT, `lname` TEXT, `address` TEXT, `nic` TEXT, `tp` TEXT, `un` TEXT, `pw` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
  }

  @override
  PersonDao get personDao {
    return _personDaoInstance ??= _$PersonDao(database, changeListener);
  }
}

class _$PersonDao extends PersonDao {
  _$PersonDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _personInsertionAdapter = InsertionAdapter(
            database,
            'Person',
            (Person item) => <String, dynamic>{
                  'id': item.id,
                  'serial': item.serial,
                  'fname': item.fname,
                  'lname': item.lname,
                  'address': item.address,
                  'nic': item.nic,
                  'tp': item.tp,
                  'un': item.un,
                  'pw': item.pw
                },
            changeListener),
        _personUpdateAdapter = UpdateAdapter(
            database,
            'Person',
            ['id'],
            (Person item) => <String, dynamic>{
                  'id': item.id,
                  'serial': item.serial,
                  'fname': item.fname,
                  'lname': item.lname,
                  'address': item.address,
                  'nic': item.nic,
                  'tp': item.tp,
                  'un': item.un,
                  'pw': item.pw
                },
            changeListener),
        _personDeletionAdapter = DeletionAdapter(
            database,
            'Person',
            ['id'],
            (Person item) => <String, dynamic>{
                  'id': item.id,
                  'serial': item.serial,
                  'fname': item.fname,
                  'lname': item.lname,
                  'address': item.address,
                  'nic': item.nic,
                  'tp': item.tp,
                  'un': item.un,
                  'pw': item.pw
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _personMapper = (Map<String, dynamic> row) => Person(
      row['id'] as int,
      row['serial'] as String,
      row['fname'] as String,
      row['lname'] as String,
      row['address'] as String,
      row['nic'] as String,
      row['tp'] as String,
      row['un'] as String,
      row['pw'] as String);

  final InsertionAdapter<Person> _personInsertionAdapter;

  final UpdateAdapter<Person> _personUpdateAdapter;

  final DeletionAdapter<Person> _personDeletionAdapter;

  @override
  Future<List<Person>> findAllPersons() async {
    return _queryAdapter.queryList('SELECT * FROM Person',
        mapper: _personMapper);
  }

  @override
  Stream<List<Person>> findAllPersonsAsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM Person',
        tableName: 'Person', mapper: _personMapper);
  }

  @override
  Future<Person> findPersonById(int id) async {
    return _queryAdapter.query('SELECT * FROM Person WHERE id = ?',
        arguments: <dynamic>[id], mapper: _personMapper);
  }

  @override
  Future<Person> findPersonByUnPw(String un, String pw) async {
    return _queryAdapter.query(
        'SELECT * FROM Person WHERE Person.un = ? AND Person.pw = ?',
        arguments: <dynamic>[un, pw],
        mapper: _personMapper);
  }

  @override
  Future<Person> findPersonMaxId() async {
    return _queryAdapter.query(
        'SELECT * FROM Person WHERE id = (SELECT MAX(id) FROM Person)',
        mapper: _personMapper);
  }

  @override
  Future<int> insertPerson(Person person) {
    return _personInsertionAdapter.insertAndReturnId(
        person, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<int> updatePerson(Person person) {
    return _personUpdateAdapter.updateAndReturnChangedRows(
        person, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<int> removePerson(Person person) {
    return _personDeletionAdapter.deleteAndReturnChangedRows(person);
  }
}
