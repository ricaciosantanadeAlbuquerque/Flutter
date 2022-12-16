import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaginaInicial extends StatefulWidget{

  const PaginaInicial({super.key});

  @override
  State<StatefulWidget> createState(){
    return Estado();
  }
}
// estado=====================================================================================

class Estado extends State<StatefulWidget>{
  int cont = 0;
  @override
Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      title: const Center(
        child: Text( "Contador",
        style: TextStyle(
          fontSize: 50,
          
          color: Colors.blue
        ))
      )
    ),
    body:Container(
      child:Center(
        child: GestureDetector(
          child: Text(
            "Contando $cont",
             style: const TextStyle(
              fontSize: 40,
              color:Colors.red
              )),
              onTap: (){
                setState(() {
                cont++;   
                });
              },
        ),
      )
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: (){
        setState((){
          cont++;
        });
      },
      child: Icon(Icons.add))
  );
}
}