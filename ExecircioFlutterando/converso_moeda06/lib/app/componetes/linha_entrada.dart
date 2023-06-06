import 'package:flutter/material.dart';

import '../model/moeda.dart';

class LinhaEntrada extends StatelessWidget {
  final TextEditingController controle;
  final List<Moeda> lista;
  final Moeda selecionado;
  final void Function(Moeda?) funcao;

  const LinhaEntrada({super.key, required this.controle, required this.lista, required this.selecionado, required this.funcao});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Row(children: [
      Expanded(
        flex: 2,
        child: Container(
          height: 63,
          child: DropdownButton(
            value: selecionado,
            iconEnabledColor: Colors.amberAccent,
            isExpanded: true,
            underline: Container(height: 1, color: Colors.amberAccent),
            items: lista.map((element) => DropdownMenuItem(value: element, child: Text(element.nome))).toList(),
            onChanged: funcao,
          ),
        ),
      ),
      const SizedBox(width: 20),
      Expanded(
        flex: 5,
        child: TextField(
          controller: controle,
          decoration: const InputDecoration(enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.amberAccent))),
        ),
      )
    ]));
  }
}
