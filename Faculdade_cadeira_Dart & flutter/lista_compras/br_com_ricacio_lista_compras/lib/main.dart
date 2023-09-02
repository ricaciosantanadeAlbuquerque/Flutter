

import 'package:flutter/material.dart';

void main(List<String> args){
  runApp(MaterialApp(
    title: 'ListaCompras',
    theme: ThemeData(
      primarySwatch:Colors.blue,
      brightness: Brightness.light
    ),
    home: const PaginaInicial(),
  ));
}

class PaginaInicial extends StatefulWidget{
   const PaginaInicial({super.key});
   @override
  State<StatefulWidget> createState() => Estado(); // retorno =>
}

class Estado extends State<StatefulWidget>{

    List<String> lista = [];

  String entrada = "";

  /*@override
  void initState(){ // Sobrepossição
    super.initState();

    for(int i = 0; i < 4 ; i++){
      lista.add("produto $i ");
    }
    
  }*/
 @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Compras "),
        centerTitle:true
      ),
      body: ListView.builder(
        itemCount: lista.length,
        itemBuilder: (BuildContext context,int index){

        return Dismissible(
          key: Key(lista[index]), 
          child: Card(
            color: Color.fromARGB(255, 246, 243, 243),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            ),
              child: ListTile(
                title: Text(lista[index]),
                trailing: IconButton(
                  onPressed:(){},
                   icon: const Icon(Icons.check_box_outline_blank),
                   color: Color.fromARGB(255, 9, 255, 0),),

                  
              )
          )
          );
        
      } ),
      floatingActionButton: FloatingActionButton(onPressed: () {
         showDialog(
          context: context, 
          builder: (BuildContext context){
            return  AlertDialog(
              shape:RoundedRectangleBorder(
                borderRadius:  BorderRadius.circular(30)
              ),
               title: const Text("Digite uma produto"),
               content: TextField(
                onChanged:(text){
                  entrada = text;
                }
               ),
               actions:<Widget>[
                ElevatedButton(onPressed:(){
                  setState(() {
                    lista.add(entrada);
                    Navigator.of(context).pop();
                  });
                }, child: const Text("Cadastrar"))
               ]
            );
          });
        },child: const Icon(Icons.add))
    );
  }
}