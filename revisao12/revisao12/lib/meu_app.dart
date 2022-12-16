import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:revisao12/inicio.dart';

class MeuApp extends StatelessWidget{
    const MeuApp({super.key});
    @override
    Widget build(BuildContext context){
      return MaterialApp(
        theme:ThemeData(
          primarySwatch:Colors.green
        ),
        home: const Inicio()
      );
    }
}