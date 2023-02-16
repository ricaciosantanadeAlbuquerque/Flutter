
import 'package:facebook/view/cadastro.dart';
import 'package:facebook/view/inicio.dart';
import 'package:facebook/view/mostrar_dados.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  // como a classe StatelessWidget é uma classe abstrata é necessário implementar seus métodos
  const MeuApp({super.key});
  @override  // polimorfismo de sobreposição obrigatório 
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      initialRoute: "inicio",
      routes:{
        "inicio":(context) =>  Inicio(),
         "cadastro":(context) =>  Cadastro(),
         "mostraDados":(context) =>  MostraDados()
      },
      
    );
  }
}
