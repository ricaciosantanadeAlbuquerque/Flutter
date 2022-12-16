import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaginaInicial extends StatefulWidget{

  const PaginaInicial({super.key});
  @override
  State<StatefulWidget>createState(){
    return Estado();
  }
}
//==========================================================================
class Estado extends State<StatefulWidget>{
   
   @override
   Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child:Text("Menu")
        )
      ),
      body: Container(
        width: 200,
        height: 200,
        color:Colors.black,
         child: Align(
          alignment: Alignment.center,
           child:Container(
          width: 100,
          height:100,
          color: Colors.green
        ),
         )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed:(){

      })
    );
   }
}