import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:revisao07/home_page.dart';

class MeuApp extends StatelessWidget{
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
      home: const PaginaInicial()
    );
  }
}