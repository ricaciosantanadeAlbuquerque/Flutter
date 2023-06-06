import 'package:converso_moeda06/app/componetes/imagem.dart';
import 'package:converso_moeda06/app/componetes/linha_entrada.dart';
import 'package:converso_moeda06/app/controller/controle.dart';
import 'package:flutter/material.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});
  @override
  HomeAppState createState() => HomeAppState();
}

class HomeAppState extends State<HomeApp> {
  TextEditingController entrada = TextEditingController();
  TextEditingController saida = TextEditingController();
  Controle? controle;

  @override
  void initState() {
    controle = Controle(entrada: entrada, saida: saida);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
        child: ListView(
           children: [
          const Imagens(),
          LinhaEntrada(
            controle: entrada,
            lista: controle!.lista,
            selecionado: controle!.de!,
            funcao: (moeda) {
              setState(() {
                controle!.de = moeda;
              });
            },
          ),
          const SizedBox(
            height: 10,
          ),
          LinhaEntrada(
            controle: saida,
            lista: controle!.lista,
            selecionado: controle!.para!,
            funcao: (moeda) {
              setState(() {
                controle!.para = moeda;
              });
            },
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.amberAccent),
              onPressed: () {
                controle!.converter();
              },
              icon: const Icon(Icons.currency_bitcoin),
              label: const Text('CONVERTER'))
        ]),
      ),
    );
  }
}
