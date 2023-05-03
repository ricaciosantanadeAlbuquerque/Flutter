import 'package:converso_moeda/app/componentes/bot%C3%A3o.dart';
import 'package:converso_moeda/app/componentes/imagem.dart';
import 'package:converso_moeda/app/componentes/linha.dart';
import 'package:converso_moeda/app/controller/controle.dart';
import 'package:flutter/material.dart';

class HomeApp22 extends StatefulWidget {
  const HomeApp22({
    super.key,
  });
  @override
  HomeAppState createState() => HomeAppState();
}

class HomeAppState extends State<HomeApp22> {
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
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Imagem(),
            Linha(
              controller: entrada,
              lista: controle!.lista,
              selecionado: controle!.de!,
              funcao: (value) {
                setState(() {
                  controle!.de = value;
                });
              },
            ),
            Linha(
              controller: saida, 
              lista: controle!.lista,
              selecionado: controle!.para!,
              funcao: (valeu) {
                setState(() {
                  controle!.para = valeu;
                });
              },
            ),
            const SizedBox(
              height: 25,
            ),
            Botao(funcao: () {
              controle!.converter();
            })
          ],
        ),
      ),
    ));
  }
}
