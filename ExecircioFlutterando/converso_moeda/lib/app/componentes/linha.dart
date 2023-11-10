import 'package:flutter/material.dart';

import '../model/moeda.dart';

class Linha extends StatelessWidget {
  final List<Moeda> lista;
   final TextEditingController controller;
  final Moeda selecionado;
  final void Function(Moeda?)?  funcao;

  Linha({
    super.key,
    required this.controller, 
    required this.lista,
    required this.selecionado,
    required this.funcao});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(children: [
      Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 63,
              child: DropdownButton<Moeda>(
                  isExpanded: true,
                  value: selecionado,
                  underline: Container(
                    color: Colors.amberAccent,
                    height: 1,
                  ),
                  items: lista.map((element) => DropdownMenuItem(value: element,child: Text(element.nome))).toList(),
                  onChanged:funcao),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            flex: 4,
            child: TextField(
                controller: controller,
                decoration: const InputDecoration(enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.amberAccent)), focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.amberAccent)
                )
                )
                ),
          )
        ],
      )
    ]));
  }
}
