
import 'package:flutter/material.dart';
import 'package:lista_compras_projeto/model/produto.dart';
import 'package:lista_compras_projeto/util/cadastrando_produto.dart';

class Inicio extends StatefulWidget{
   const Inicio({super.key});
   @override
   State<StatefulWidget> createState(){
      return Estado();
   }
}

class Estado extends State<StatefulWidget>{
    TextEditingController p = TextEditingController();
   Produto produto = Produto();

  List<Produto> lista1 = [];
 
 CadastrandoProduto db = CadastrandoProduto();

 void salvarContatos() async{
  setState(() async{
    Produto obj = Produto(produto: p.text,marcado1: false);
    
    int resultado = await db.inserirContato(obj);

    // ignore: unnecessary_null_comparison
    if(resultado != null){
      print("Dados cadastrados com sucesso "+ resultado.toString());
    }else{
      print("Erro! os dados nao fora salvos");
    }
    p.clear();
    recuperarDados();
  });
 }

 void recuperarDados()async{
  List produtosRecuperados = await db.listarContatos();

  List<Produto>? listaTemporaria = [];

  for( var item in produtosRecuperados){
    Produto obj = Produto.toProduto(item);
    listaTemporaria.add(obj);

  }
  //==========================================================================
  setState(() {
    lista1 = listaTemporaria!;    
   
  });
  listaTemporaria = null;
  //print('produtos recuperados'+ produtosRecuperados.toString());
 }
//============================================================================
 @override
  void initState() {
   
    super.initState();
    recuperarDados();
    
  }
  //===========================================================================
      @override
    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: const Text("Lista de Compras"),
          centerTitle:true
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
              child: Column(
                children: <Widget>[
                  TextField(
                    autofocus: true,
                     controller: p,
                     decoration: const InputDecoration(
                      border:OutlineInputBorder(
                      ),
                      hintText: "Produto",
                      prefixIcon: Icon(Icons.assignment)
                    ),
                    
                  ),
                  Container(
                    width:double.infinity,
                    child: ElevatedButton(onPressed: () {  
                      setState(() {
                       salvarContatos();
                        
                        lista1.add(Produto(produto: p.text,marcado1: false));
                        
                                  //  ORDENAÇÃO PELO MÉTODO BOLHA 

                                    for(int i = 0; i < lista1.length;i++){
                                      for(int j = 0; j <(lista1.length -1 );j++){
                                        if(lista1[j].marcado1 == true && lista1[j + 1].marcado1 == false){
                                          Produto  auxiliar = lista1[j];
                                          lista1[j] = lista1[j+1];
                                          lista1[j + 1] = auxiliar;
                                        }
                                      }
                                    } 
                      });
                    },
                    child: const Text("Cadastrar")
                    )
                  ),
                  Container(
                    color:Colors.green,
                    width:400,
                    height:400,
                    child: ListView.builder(
                      itemCount: lista1.length,
                      itemBuilder: (BuildContext context,int index){
                        final Produto item = lista1[index];
                        return 
                           Card(
                             child: CheckboxListTile(
                              title: Text(item.produto!),
                              key: Key(item.produto!),
                              value: item.marcado1,
                               onChanged:(value){
                                 setState(() {
                                   item.marcado1 = value;
                                   
                                  //  ORDENAÇÃO PELO MÉTODO BOLHA 

                                    for(int i = 0; i < lista1.length;i++){
                                      for(int j = 0; j <(lista1.length -1 );j++){
                                        if(lista1[j].marcado1 == true && lista1[j + 1].marcado1 == false){
                                          Produto  auxiliar = lista1[j];
                                          lista1[j] = lista1[j+1];
                                          lista1[j + 1] = auxiliar;
                                        }
                                      }
                                    } 
                                  
                                 });
                               }),
                           );
                      
                      },
                    ),
                    
                  )
                ],
              ),
          ),
            ),
          ),
        )
       
      );
    }
}