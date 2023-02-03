import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/Moeda_modelo.dart';

class CompoTextField extends StatelessWidget {
  List<Moeda> item;
  final Moeda selecionarItem;
  final TextEditingController controlle;
  void Function(Moeda?)? onChanged;

  CompoTextField({super.key, required this.controlle, required this.item, required this.onChanged,required this.selecionarItem});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(children: <Widget>[
        Expanded(
            flex: 1,
            child: Container(
                height: 62,
                child: DropdownButton<Moeda>(
                    isExpanded: true,
                    value: selecionarItem,
                    iconEnabledColor: Colors.amber,
                    underline: Container(color: Colors.amber, height: 1),
                    items: item.map((e) => DropdownMenuItem(value: e, child: Text(e.nome))).toList(), // o 'e' simboliza cada elemento  da nossa lista 'item<Moeda>'
                    onChanged: onChanged))),
        const SizedBox(width: 20),
        Expanded(
          flex: 4,
          child: TextField(
              controller: controlle, decoration: const InputDecoration(enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.amber)), focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.amber)))),
        )
      ]),
    );
  }
}
