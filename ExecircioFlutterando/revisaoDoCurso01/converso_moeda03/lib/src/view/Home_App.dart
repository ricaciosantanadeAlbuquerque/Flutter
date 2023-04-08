import 'package:converso_moeda03/src/components/components.dart';
import 'package:converso_moeda03/src/controller/controle.dart';
import 'package:flutter/material.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});
  @override
  EstdaoApp createState() => EstdaoApp();
}

class EstdaoApp extends State<HomeApp> {
  TextEditingController entrada = TextEditingController();
  TextEditingController saida = TextEditingController();
  Controle? controle;

  @override
  void initState() {
    super.initState();
    controle = Controle(entrada: entrada, saida: saida);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Image.asset('assets/logo.jpg', width: 100, height: 100),
                const SizedBox(height: 40),
                Componentes(
                    controle: entrada,
                    lista: controle!.lista,
                    selecionado: controle!.de,
                    funcao: (value) {
                      setState(() {
                        controle!.de = value;
                      });
                    }),
                Componentes(
                    controle: saida,
                    lista: controle!.lista,
                    selecionado: controle!.para,
                    funcao: (value) {
                      setState(() {
                        controle!.para = value;
                      });
                    }),
                const SizedBox(
                  height: 33,
                ),
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amberAccent,
                    ),
                    onPressed: () {
                      controle!.converte();
                    },
                    icon: const Icon(Icons.refresh_outlined),
                    label: const Text("CONVERTE"))
              ]),
            )));
  }
}
