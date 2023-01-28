import 'package:converso_curso/app/componentes/TextField_componentes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../controle/home_controller.dart';

class HomeView extends StatefulWidget {

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  Controle? controle;

  final TextEditingController entrada = TextEditingController();

  final TextEditingController saida = TextEditingController();
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
        padding: const EdgeInsets.only(top: 50, left: 30, right: 30, bottom: 20),
        child: Column(
          children: <Widget>[
            Image.asset("assets/imagem/converso.jpg", width: 100, height: 100),
            const SizedBox(height: 15),
            TextComponentes(
                item: controle!.moeda!,
                controller: entrada,
                onChanged: (modelo) {
                  setState(() {
                    controle!.deMoeda = modelo;
                  });
                },
                selecionar: controle!.deMoeda!),
            const SizedBox(height: 10),
            TextComponentes(
              item: controle!.moeda!,
              controller: saida,
              onChanged: (modelo) {
                setState(() {
                  controle!.paraMoeda = modelo;
                });
              },
              selecionar: controle!.paraMoeda!,
            ),
             SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
              onPressed: () {
                controle!.converte();
              },
              child: const Text("CONVERTE"),
            )
          ],
        ),
      ),
    ));
  }
}
