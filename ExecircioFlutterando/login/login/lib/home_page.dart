import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/tela_2.dart';

class Gerente extends StatefulWidget {
  const Gerente({super.key});
  @override
  State<StatefulWidget> createState() {
    return Estado();
  }
}

class Estado extends State<StatefulWidget> {
  String emial = "";
  String senha = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        TextField(
            onChanged: (text) {
              emial = text;
            },
            decoration: const InputDecoration(labelText: "Email", border: OutlineInputBorder())),
        Container(height: 10),
        TextField(
            onChanged: (text) {
              senha = text;
            },
            obscureText: true,
            decoration: const InputDecoration(labelText: "Senha", border: OutlineInputBorder())),
        Container(height: 15),
        ElevatedButton(
            onPressed: () {
              if (emial == "1" && senha == "2") {
                Navigator.of(context).pushReplacementNamed("tela2");
              }
            },
            child: const Text("Entrar"))
      ])),
    ));
  }
}
