import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tela2 extends StatefulWidget {
  final String nome;
  const Tela2({required this.nome});
  @override
  State<Tela2> createState() {
    return EstadoTela2();
  }
}

class EstadoTela2 extends State<Tela2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Passando valores entre Telas"),
          centerTitle:true
        ),
        body:Center(
          child:Text("Você salvou o nome === ${widget.nome} ")
        )
    );
  }
}
