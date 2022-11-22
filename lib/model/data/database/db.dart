import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DB {
// construtor de acesso privado
  DB._();

  static final DB instance = DB._();

// instancia do Sqlite
  static Database? _database;

  get database async {
    if (_database != null) return _database;
    return await _initDatabase();
  }

  _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'green.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(db, versao) async {
    await db.execute(_cartoes);
    await db.execute(_meuGreen);
    await db.execute(_meusSaldo);
    await db.execute(_carteira);
    await db.execute(_historico);
    await db.insert({'gastos': 0});
  }

  String get _cartoes => '''
      CREATE TABLE   meu saldo(
id   INTEGER PRIMARY KEY AUTOINCRIMENT,
saldo REAL
        );
      ''';

  String get _meuGreen => '''
      CREATE TABLE   meuGrenn(
id   INTEGER PRIMARY KEY AUTOINCRIMENT,
saldo REAL
      );
      ''';

  String get _meusSaldo => '''
      CREATE TABLE   meuGrenn(
id   INTEGER PRIMARY KEY AUTOINCRIMENT,
saldo REAL
      );
      ''';

  String get _carteira => '''
      CREATE TABLE   meuGrenn(
sigla  TEXT PRIMARY KEY AUTOINCRIMENT,
valor TEXT,
quantidade TEXT
      );
      ''';

  String get _historico => '''
      CREATE TABLE   historico(
id   INTEGER PRIMARY KEY AUTOINCRIMENT,
data_operacao  INT,
tipo _operacao TEXT,
valor REAL,
      );
      ''';
}
