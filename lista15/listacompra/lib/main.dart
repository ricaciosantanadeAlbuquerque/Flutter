

import 'package:flutter/material.dart';

main(List<String> args){
  runApp(const Meuapp());
}

class Meuapp extends StatelessWidget{
  const Meuapp({super.key});
@override
Widget build(BuildContext context){
 return MaterialApp(
  theme:ThemeData(
    primarySwatch:Colors.red,
    brightness:Brightness.light
  ),
  home:Gerente()
 );
}
}


class Gerente extends StatefulWidget{
@override
State<StatefulWidget>createState(){
return Estado();
} 
}

class Estado extends State<StatefulWidget>{

  List<String> num1 = [];
  String valor = "";

  @override
Widget build(BuildContext context){
return Scaffold(
  appBar: AppBar(
    title: const Center(child: Text("Lista de compras"))
  ),
  body: Container(
    width: 400,
    height:400,
    child: ListView.builder(
      itemCount: num1.length,
      itemBuilder: (BuildContext context, int index){
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
            ),
               child: ListTile(
                title:Text(num1[index]),
                  trailing: IconButton(
                    onPressed: (){
                     setState(() {
                        num1.removeAt(index);
                     });
                    },
                     icon: const Icon(Icons.delete),
                     color: Colors.red,
                    ),
               )
          );
      })
  ),
  floatingActionButton: FloatingActionButton(
    onPressed: (){
     showDialog(
      context: context,
       builder: (BuildContext context){
        return AlertDialog(
          title: const Text("Digite um valor"),
          content: TextField(
            onChanged:(text){
                valor = text;
            },
            decoration: const InputDecoration(
              border:OutlineInputBorder()
            )
          ),
          actions: [
            ElevatedButton(
              onPressed: (){
               setState(() {
                  num1.add(valor);
               });
               Navigator.of(context).pop();
              }, 
              child: const Text("adicionar"))
          ],
        );
       });
    }
    ,child:const Icon(Icons.add)),
);
}
}