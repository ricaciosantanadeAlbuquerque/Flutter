import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gerencia_estado/controller.dart';

class Gerencia extends StatefulWidget {
  const Gerencia({super.key});
  State<StatefulWidget> createState() {
    return Estado();
  }
}

class Estado extends State<StatefulWidget> {
  int contador = 0; // declaração e inicialização da variável contador

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("Meu_APP", style: TextStyle(color: Colors.green, fontSize: 20.0)
            )
            ),
              actions: <Widget>[
                MudarTema()
              ]
            ),
        body: Container(
            child: Column(
              mainAxisAlignment:MainAxisAlignment.center,
              children: <Widget>[
          GestureDetector(
              child: Text("Contador $contador"),
              onTap: () {
                setState(() {
                  contador++;
                });
              }),
          const SizedBox(
            height: 10,
          ),
          MudarTema(),
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceAround,
            children:<Widget>[
              Container(
                height:50,
                width:50,
                color:Colors.black
              ),
              Container(
                height:50,
                width:50,
                color:Colors.black
              ),
              Container(
                height:50,
                width:50,
                color:Colors.black
              )
            ]
          )
        ])),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                contador++;
              });
            },
            child: const Icon(Icons.add)));
  }
}

// componentizando===================================================================================================================
class MudarTema extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
        value: Controle.instancia.mudar, // acessando o atribulto logico pela instâcina da classe controle
        onChanged: (value) {
          Controle.instancia.mudanca(); // acessando  o método mudanca pela instâcia da classe controle
        });
  }
}
