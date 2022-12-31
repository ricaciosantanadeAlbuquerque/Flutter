import 'package:facebook/cadastro.dart';
import 'package:facebook/inicio.dart';
import 'package:facebook/mostrar_dados.dart';
import 'package:flutter/cupertino.dart';
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
        "inicio":(context) => const Inicio(),
         "cadastro":(context) => const Cadastro(),
         "mostraDados":(context) => const MostraDados()
      },
      
    );
  }
}
