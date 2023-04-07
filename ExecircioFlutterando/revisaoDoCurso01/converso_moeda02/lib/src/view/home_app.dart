import 'package:converso_moeda02/src/components/components.dart';
import 'package:converso_moeda02/src/controller/controle.dart';
import 'package:converso_moeda02/src/model/moeda.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  HomeAppEstado createState() => HomeAppEstado();
}

class HomeAppEstado extends State<HomeApp> {
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
        padding: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ClipOval(
            child: Image.asset('assets/image/logo.jpg', width: 100, height: 100),
          ),
          const SizedBox(
            height: 10,
          ),
          Components(
              controle: entrada,
              lista: controle!.lista,
              selecionar: controle!.de!,
              onChanged: (valeu) {
                setState(() {
                  controle!.de = valeu;
                });
              }),
          Components(
              controle: saida,
              lista: controle!.lista,
              selecionar: controle!.para!,
              onChanged: (value) {
                setState(() {
                  controle!.para = value;
                });
              }),
          const SizedBox(height: 30),
          ElevatedButton.icon(
              onPressed: () {
                controle!.converter();
              },
              icon: const Icon(Icons.refresh_outlined),
              label: const Text("CONVERTE"))
        ]),
      ),
    ));
  }
}
