import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/gerente.dart';

import 'controlle.dart';

class TelaGerenciar extends StatefulWidget {
  const TelaGerenciar({super.key});
  @override
  State<StatefulWidget> createState() {
    return homePageEstado();
  }
}

// ignore: camel_case_types
class homePageEstado extends State<StatefulWidget> {
  int contador = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
            child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(currentAccountPicture: ClipRRect(borderRadius: BorderRadius.circular(40), child: Image.asset("assets/11.jpg")), accountName: const Text("RIcacio"), accountEmail: const Text("ricaciozz@gmial.com")),
            const ListTile(
              leading: Icon(Icons.home),
              title: Text("Incio"),
              subtitle: Text("homePage"),
            ),
            ListTile(
                leading: const Icon(Icons.restart_alt),
                trailing: const Icon(Icons.delete),
                title: const Text(" Sair"),
                subtitle: const Text("voltar"),
                onTap: () {
                  setState(() {
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                      return const Gerente();
                    }));
                  });
                })
          ],
        )),
        appBar: AppBar(title: const Center(child: Text("Home Page"))),
        body: Container(
            child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            GestureDetector(
                child: Text("Contador $contador"),
                onTap: () {
                  setState(() {
                    contador++;
                  });
                }),
            Container(
                child: Switch(
                    value: Controle.instancia.troca,
                    onChanged: (valeu) {
                      setState(() {
                        Controle.instancia.trocarValor();
                      });
                    })),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[Container(width: 50, height: 50, color: Colors.black), Container(width: 50, height: 50, color: Colors.black), Container(width: 50, height: 50, color: Colors.black)])
          ]),
        )),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                contador++;
              });
            },
            child: const Icon(Icons.add)));
  }
}
