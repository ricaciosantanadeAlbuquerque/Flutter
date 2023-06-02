import 'package:flutter/material.dart';

import 'botao.dart';
import 'campo_texto.dart';

class Coluna extends StatelessWidget {
  final TextEditingController login;
  final TextEditingController senha;
  final void Function() funcao;
  const Coluna({super.key, required this.login,required this.senha,required this.funcao});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
        Container(
          width: 100,
          height: 100,
          margin: const EdgeInsets.all(10),
          child: Image.asset('assets/logo.png'),
        ),
        Card(
          child: Padding(
            padding:const EdgeInsets.all(10),
            child: Column(
              children: [
            CampoTexto(controle: login),
            const SizedBox(height:10),
            CampoTexto(controle: senha),
            const SizedBox(height:20),
            Botao(funcao: funcao),
            ],
            ),
          ),
          ),
      ]),
    );
  }
}
