import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tela2 extends StatefulWidget {
  String nome;

  Tela2({super.key, required this.nome});

  @override
  EstadoTela02 createState() {
    return EstadoTela02();
  }
}

class EstadoTela02 extends State<Tela2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(" Seu nome é ${widget.nome}")),
    );
  }
}
