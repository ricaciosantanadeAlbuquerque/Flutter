import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/Moeda.dart';

class Componente extends StatelessWidget {
  
  final TextEditingController controller;
  final Moeda selecinado;
  final List<Moeda> item;
  void Function(Moeda?) onChanged;

  Componente({super.key, required this.controller, required this.item, required this.selecinado, required this.onChanged}); // recebe os argumento  pelo construtor da classe

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 62,
              child: DropdownButton<Moeda>(
                value: selecinado,
                underline: Container(
                  height: 1, 
                  color: Colors.amber),
                   isExpanded: true,
                    iconEnabledColor: Colors.amber, 
                    items: item.map((e) => DropdownMenuItem(value:e,child: Text(e.nome!))).toList(),
                    // map(e) pega cada elemento do array list e joga para DropdownMenuButton, 'e' é uma instancia 
                     onChanged: onChanged),
            ),
          ),
          Container(width: 20),
          Expanded(
            flex: 4,
            child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber),
                    ),
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.amber)))),
          )
        ],
      ),
    );
  }
}
