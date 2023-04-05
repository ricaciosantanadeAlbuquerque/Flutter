import 'package:flutter/material.dart';

import '../model/moeda.dart';

class Componente extends StatelessWidget {
  List<Moeda> lista = [];
  final Moeda itemSelecionado;
  TextEditingController controller = TextEditingController();
    void Function(dynamic)? onChanged;

  Componente({super.key, required this.onChanged, required this.lista, required this.controller,required this.itemSelecionado});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: SizedBox(
              height: 63,
              child: DropdownButton(
                  value: itemSelecionado,
                  iconEnabledColor: Colors.amberAccent,
                  underline: Container(height: 1, color: Colors.amberAccent),
                  items: lista.map((element) => DropdownMenuItem( value:element, child: Text(element.nome))).toList()
                  ,
                  onChanged: onChanged),
            )),
        const SizedBox(width: 20),
        Expanded(
          flex: 3,
          child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.amberAccent)
                ), focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.amberAccent)
                )
                )
                ),
        ),
      ],
    );
  }
}
