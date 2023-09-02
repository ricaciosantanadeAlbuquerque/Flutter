import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(List<String> args){

 runApp(const MyApp(titulo: "curso de flutter"));

}

class MyApp extends StatelessWidget{
   final String titulo;
  const MyApp({super.key,required this.titulo});

 @override
 Widget build(BuildContext context){
    return MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.red
            ),
            home: Container(
              child:  Center(
                child: Text(titulo,
                textDirection: TextDirection.ltr,
                style: const TextStyle(
                    fontSize: 25
                ),
                ),
              )
            ),
    );
}

}