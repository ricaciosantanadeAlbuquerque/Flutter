import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:passando_dados/Tela02.dart';

class Tela01 extends StatefulWidget {
  @override
  EstadoTela01 createState() {
    return EstadoTela01();
  }
}

class EstadoTela01 extends State<Tela01> {
  TextEditingController entrada = TextEditingController();

  void salvar() {
    String nome;

    setState(() {
      nome = entrada.text;

      Navigator.push(context, MaterialPageRoute(builder: ((context) => Tela2(nome: nome))));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Tela1"), centerTitle: true),
        body: Column(children: <Widget>[
          TextField(
            controller: entrada,
          ),
          ElevatedButton(
            onPressed: salvar,
            child: const Text("Slavar"),
          )
        ]));
  }
}
