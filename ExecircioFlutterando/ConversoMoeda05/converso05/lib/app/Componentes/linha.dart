import 'package:converso05/app/models/moeda.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Linha extends StatelessWidget {
  TextEditingController controller;
  Moeda selecionado;
  List<Moeda> lista;
  void Function(Moeda? moeda) onChanged;

  Linha({super.key, required this.controller, required this.lista, required this.onChanged,required this.selecionado});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 63,
            child: DropdownButton(
              underline: Container(height: 1,color: Colors.amberAccent,),
              value: selecionado,
              items: lista.map((e) => DropdownMenuItem(value: e,child: Text(e.nome))).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          flex: 4,
          child: TextField(
              controller: controller,
              decoration: const InputDecoration(enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.amberAccent)), focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.amberAccent)))),
        )
      ],
    );
  }
}
