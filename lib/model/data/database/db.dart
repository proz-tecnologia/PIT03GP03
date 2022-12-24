import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


abstract class DB {
  _recuperarBancoDados() async {
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBancoDados, 'banco.db');

    var bd = await openDatabase(
        localBancoDados,
        version: 1,
        onCreate: (db, dbVersaoRecente) {
          //iINTEGER,VARCHAR,TEXT

          String sql = "CREATE TABLE usuarios(id INTENGER  PRIMARY KEY AUTOINCREMENT,nome VARCHAR) ";

          db.execute(sql);
        }
    );
return bd;



  }
}


