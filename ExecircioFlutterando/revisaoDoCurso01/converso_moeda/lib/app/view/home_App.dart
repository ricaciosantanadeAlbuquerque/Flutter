import 'package:converso_moeda/app/component/components.dart';
import 'package:converso_moeda/app/controller/controle.dart';
import 'package:flutter/material.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => Estado();
}

class Estado extends State<HomeApp> {
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
            ClipOval(child: Image.asset('assets/logo.jpg', width: 100, height: 100)),
            Componente(
              controller: entrada,
              lista: controle!.lista,
              itemSelecionado: controle!.de!,
              onChanged: (value) {
                setState(() {
                controle!.de = value;
                  
                });
              },
            ),
            Componente(controller: saida,lista:controle!.lista,itemSelecionado: controle!.para!,onChanged: (value){
              setState(() {
                controle!.para = value;
              });
            }),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: () {
              controle!.converter();
            }, child: const Text('CONVERTE'))
          ])),
    ));
  }
}
