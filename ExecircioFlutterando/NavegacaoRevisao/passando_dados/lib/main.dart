import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:passando_dados/Tela01.dart';

void main(List<String> args){
   runApp(MeuApp());
}

class MeuApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: Tela01(),
    );
  }
}

