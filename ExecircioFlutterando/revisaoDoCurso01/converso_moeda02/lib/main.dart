import 'package:converso_moeda02/src/view/home_app.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget{
  const MeuApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
       theme:ThemeData(
        brightness:Brightness.dark,
        primarySwatch:Colors.amber
       ),
       home: const HomeApp(),
    );
  }
}