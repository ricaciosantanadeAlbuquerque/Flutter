import 'package:flutter/material.dart';
import 'package:login/controle.dart';

class Tela extends StatefulWidget {
  const Tela({super.key});
  State<StatefulWidget> createState() {
    return Estado();
  }
}

class Estado extends State<StatefulWidget> {
  int Contador = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Tela_2")), actions: <Widget>[Mudar()]),
      body: Container(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        GestureDetector(
          child: Text("Contador $Contador"),
          onTap: () {
            setState(() {
              Contador++;
            });
          },
        ),
        Mudar(),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[Container(height: 50, width: 50, color: Colors.black), Container(height: 50, width: 50, color: Colors.black), Container(height: 50, width: 50, color: Colors.black)])
      ])),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              Contador++;
            });
          },
          child: const Text("Contar")),
    );
  }
}

class Mudar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
        value: Controle.instancia.verdade,
        onChanged: (value) {
          Controle.instancia.mundanca();
        });
  }
}
