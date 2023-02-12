import 'package:converso_de_moeda/Aplicativo/controller/controller.dart';
import 'package:converso_de_moeda/Aplicativo/model/Moeda.dart';
import 'package:converso_de_moeda/componentes/TextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() {
    return EstadoApp();
  }
}

class EstadoApp extends State<HomeApp> {
  TextEditingController entrada = TextEditingController();
  TextEditingController saida = TextEditingController();
  Controller? controle;

  @override
  void initState() {
    super.initState();
    controle = new Controller(entrada, saida); // passando valores para controller
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Image.asset("assets/converso.jpg", width: 100, height: 100),
                CampoTexto(
                    controller: entrada,
                    selecionar: controle!.deMoeda!,
                    array: controle!.lista!,
                    onChanged: (moeda) {
                      setState(() {
                        controle!.deMoeda = moeda;
                      });
                    }),
                CampoTexto(
                    controller: saida,
                    selecionar: controle!.paraMoeda!,
                    array: controle!.lista!,
                    onChanged: (moeda) {
                      setState(() {
                        controle!.paraMoeda = moeda;
                      });
                    }),
                    const SizedBox(height:25),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amberAccent
                  ),
                    onPressed: () {
                      controle!.converter();
                    },
                    child: const Text("CONVERTE"))
              ]),
            )));
  }
}
