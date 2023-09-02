 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyAppWidget(titulo: "13"));
}


class MyAppWidget extends StatelessWidget{
 // Atribulto 
  final String titulo; 

  //Construtor =====================================
  const MyAppWidget({super.key, required this.titulo});

  // implementação método build()
   @override
  Widget build(BuildContext context){
    return Container(
      child: const Center(
        child: Text("13",
        textDirection: TextDirection.ltr,
        style: TextStyle(
          color: Colors.red,
          fontSize:50
        ),
        )
      )
    );
  }
  
  
}