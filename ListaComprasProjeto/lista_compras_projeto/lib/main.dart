import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lista_compras_projeto/pagina_inicio.dart';

void main(List<String> args){
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget{
  const MeuApp({super.key});
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Lista de compras",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: const Inicio()
    );
  }
}