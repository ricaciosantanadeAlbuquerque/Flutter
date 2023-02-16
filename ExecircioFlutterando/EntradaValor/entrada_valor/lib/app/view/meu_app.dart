import 'package:entrada_valor/app/view/Tela2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../controller/controle.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() {
    return Estado();
  }
}

class Estado extends State<Home> {
  TextEditingController entrada = TextEditingController();
  TextEditingController sainda = TextEditingController();
  Controle? controle;
  Tela2? tela;
  @override
  void initState() {
    controle = new Controle(entrada, sainda);
    

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(controller: entrada, decoration: const InputDecoration(hintText: "Entrada")),
              TextField(
                controller: sainda,
                decoration: const InputDecoration(hintText: "Sainda"),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      controle!.saidaDados();
                    });
                    Navigator.of(context).push(MaterialPageRoute(builder: ((context) => Tela2(sainda: sainda,))));
                  },
                  child: const Text("entrar"))
            ],
          ),
        ),
      ),
    );
  }
}
