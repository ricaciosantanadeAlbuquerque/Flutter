
import 'package:flutter/material.dart';

void main(List<String>args){
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget{
   const MeuApp({super.key});
   @override
   Widget build(BuildContext context){
      return MaterialApp(
        theme:ThemeData(
          primarySwatch: Colors.red
        ),
        home: const Gerente(),
      );
   }
}

class Gerente extends StatefulWidget{
  const Gerente({super.key});

  @override
 State<StatefulWidget> createState(){
  return Estado();
  }
}

class Estado extends State<StatefulWidget>{
  String valor = "";
  List<String> lista = [];
  @override
  Widget build(BuildContext context){
     return Scaffold(
      appBar:AppBar(
        title:const Center(child: Text("Lista de compras "))
      ),
      body:ListView.builder(
        itemCount:lista.length,
        itemBuilder: (BuildContext context,index){
          return Card(
            shape:RoundedRectangleBorder(
              borderRadius:BorderRadius.circular(0.3),
            ),
            child: ListTile(
              title: Text(lista[index]),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: (){
                 setState(() {
                   lista.removeAt(index);
                 });
                },
                )
            )
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  
       showDialog(
        context: context, 
        builder: (BuildContext context){
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.3)
            ),
            title: const Text("Digite um valor"),
            content: TextField(
              onChanged:(text){
                  valor = text;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText:"digite o valor "
              ),

            ),
            actions: <Widget>[
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    lista.add(valor);
                  });
                  Navigator.of(context).pop();
                },
                child: const Text("Salvar"))
            ]
          );
        });
      },
      child:const Icon(Icons.add)
      )
     );
  }
}