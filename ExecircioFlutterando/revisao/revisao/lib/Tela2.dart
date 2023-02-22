import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:revisao/controle.dart';

class Tela2 extends StatefulWidget {
  State<Tela2> createState() => EstadoTela2();
}

class EstadoTela2 extends State<Tela2> {
  int cont = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
            child: Column(
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: ClipRRect(borderRadius: BorderRadius.circular(40), child: Image.asset("assets/11.jpg")), accountName: const Text("Ricacio Santana de Albuquerque"), accountEmail: const Text("ricaciozz@gmail.com")),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Inicio"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Sair"),
              onTap: () {
                Navigator.of(context).pushNamed("/");
              },
            )
          ],
        )),
        appBar: AppBar(title: const Text("Home page"), actions: [mudanca()]),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            GestureDetector(
                child: Text("Contador $cont"),
                onTap: () {
                  setState(() {
                    cont++;
                  });
                }),
            mudanca(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [Container(width: 50, height: 50, color: Colors.black), Container(width: 50, height: 50, color: Colors.black), Container(width: 50, height: 50, color: Colors.black)],
            )
          ]),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                cont++;
              });
            },
            child: const Icon(Icons.add)));
  }

  Widget mudanca() {
    return Switch(
      value: Controle.instancia.logico,
      onChanged: (value) => Controle.instancia.mudar(),
    );
  }
}
