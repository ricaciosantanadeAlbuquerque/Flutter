import 'package:converso_moeda/app/components/components.dart';
import 'package:converso_moeda/app/controller/controller.dart';
import 'package:flutter/material.dart';


class HomeApp extends StatefulWidget {
  const HomeApp({super.key});
  @override
  State<HomeApp> createState() => EstadoApp();
}

class EstadoApp extends State<HomeApp> {
  TextEditingController entrada = TextEditingController();
  TextEditingController saida = TextEditingController();
  Controller? controle;
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
        padding: const EdgeInsets.all(12),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset('assets/logo.jpg', width: 100, height: 100),
          const SizedBox(height: 30),
          Componente(
              controle: entrada,
              lista: controle!.lista,
              selecionado: controle!.de,
              funcao: (value) {
                setState(() {
                  controle!.de = value;
                });
              }),
          Componente(
            controle: saida,
            lista: controle!.lista,
            selecionado: controle!.para,
            funcao: (value) {
              setState(() {
                controle!.para = value;
              });
            },
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
              ),
              onPressed: () {
                controle!.converte();
              },
              child: const Text('CONVERTER!', style: TextStyle(color: Colors.black)))
        ]),
      ),
    ));
  }
}
