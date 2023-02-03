import 'package:converso_de_moeda/app/componentes/TextField_components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../controller/controller.dart';
import '../model/Moeda.dart';

class HomeApp extends StatefulWidget {
  @override
  State<HomeApp> createState() {
    return EstadoApp();
  }
}

class EstadoApp extends State<HomeApp> {
  TextEditingController entrada = TextEditingController();
  TextEditingController saida = TextEditingController();
  Controller? controle;
  // ciclo de vida  só é executando uma única vez
  @override
  void initState() {
    super.initState();

     controle = Controller(entrada: entrada, saida: saida);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 60, right: 20, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                // array ou lista Widget
                Image.asset(
                  "assets/converso.jpg",
                  width: 100,
                  height: 100,
                ),
                Componente(controller: entrada, item: controle!.lista!,selecinado: controle!.deMoeda!,onChanged:(model){
                  setState(() {
                    controle!.deMoeda = model;
                  });
                }),
                Componente(controller:saida, item:controle!.lista!, selecinado:controle!.paraMoeda!, onChanged:(model){
                  setState((){
                    setState(() {
                      controle!.paraMoeda = model;
                    });
                  });
                }),
                const SizedBox(height: 40),
                ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.amber), onPressed: () {
                  controle!.converter();
                }, child: const Text("Converte"))
              ]),
            )));
  }
}
