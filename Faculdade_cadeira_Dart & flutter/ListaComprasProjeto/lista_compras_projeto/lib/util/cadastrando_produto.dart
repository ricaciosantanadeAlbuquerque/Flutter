import 'dart:io';
import 'package:lista_compras_projeto/model/produto.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CadastrandoProduto {

  // criar e  Conectar ao Banco de dados 
  // padrão singleton
  static CadastrandoProduto? _instacia; // atribultos da propria classe static 
  static Database? _database;

   // estrutura da tabela 
  String nomeTabela = 'lista_produto';
  String  colId = 'id';
  String colNome = 'produto';
  String colMarcado = 'marcado';

  void criarBanco(Database db,int versao)async{
    await db.execute('CREATE TABLE $nomeTabela ('
                    '$colId INTEGER PRIMARY KEY AUTOINCREMENT,'
                    '$colNome Text,'
                    '$colMarcado boolean)'
    
    
    );

  }
  // construtor
  CadastrandoProduto._createInstace();
   
   factory CadastrandoProduto(){
    // ignore: prefer_conditional_assignment
    if(_instacia == null){
      _instacia =  CadastrandoProduto._createInstace(); // se for nulo ele cria um objeto 
    }
    return _instacia!;
  }
  // pega o banco 

 Future<Database> get database async{
  // ignore: prefer_conditional_assignment
  if(_database == null){
    _database = await inicializarBanco();
  }
  return _database!;
 }
 Future<Database>inicializarBanco()async{
  Directory directory = await getApplicationDocumentsDirectory();
  String caminho =  directory.path + 'dblista.db';

  var bancodedados = await openDatabase(caminho, version: 1, onCreate: criarBanco);
  return bancodedados;
 }

 

  // Métodos crud

  Future<int> inserirContato(Produto obj)async{
    Database db = await this.database;

    var resultado = await db.insert(nomeTabela, obj.topMap());
    return resultado;
  }

  listarContatos() async{
    Database db = await this.database;
    String sql =  'SELECT * FROM $nomeTabela';

    List listaProduto = await db.rawQuery(sql);
    return listaProduto;
  }

  Future<int> update(Produto obj)async{
    Database db = await this.database;
    var resultado = await db.update(nomeTabela, obj.topMap(), where: "id = ? ", whereArgs: [obj.id]);

    return resultado;
  }
 

}