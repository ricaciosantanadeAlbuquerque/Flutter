import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dados extends StatefulWidget {
  final String nome;
  final int idade;
  final String endereco;
  final int telefone;
  final double salario;
   Dados({super.key, required this.nome, required this.idade, required this.endereco, required this.telefone,required this.salario});
  @override
  State<Dados> createState() {
    return EstadoDados();
  }
}

class EstadoDados extends State<Dados> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar:AppBar(
      title: const Center(
        child:Text("Dados!")
      )
     ),
     body:Container(
      child:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
       
          children: <Widget>[
            Padding(
              padding:const EdgeInsets.all(5),
              child: Text("Nome: ${widget.nome}")
            ),
            Padding(
              padding:const EdgeInsets.all(5),
              child:Text("idade: ${widget.idade}")
            ),
            Padding(
              padding:const EdgeInsets.all(5),
              child:Text("Endereço: ${widget.endereco}")
            ),
            Padding(
              padding:const EdgeInsets.all(5),
              child: Text("telefone: ${widget.telefone}")
            ),
            Padding(
              padding:const EdgeInsets.all(5),
              child: Text("Salário: ${widget.salario}")
            )
          ]
          ),
      )
     )
    );
  }
}
