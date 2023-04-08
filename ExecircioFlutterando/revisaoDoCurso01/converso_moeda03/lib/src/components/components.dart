import 'package:converso_moeda03/src/model/moeda.dart';
import 'package:flutter/material.dart';

class Componentes extends StatelessWidget {
  TextEditingController controle = TextEditingController();
  List<Moeda> lista = [];
  Moeda? selecionado;
  void Function(Moeda?)? funcao;
     Componentes({super.key,required this.controle,required this.lista,required this.selecionado,required this.funcao});
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          flex: 1,
          child: SizedBox(
            height: 63,
            child: DropdownButton(
              value: selecionado,
              isExpanded: true,
              underline: Container(height: 1, color: Colors.amberAccent),
              items: lista.map((element) => DropdownMenuItem(value: element,child: Text(element.nome))).toList(),
              onChanged: funcao,
            ),
          )),
      const SizedBox(width: 10),
      Expanded(
        flex: 4,
        child: TextField(
            controller: controle,
            decoration: const InputDecoration(enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.amberAccent)), focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.amberAccent)))),
      )
    ]);
  }
}
