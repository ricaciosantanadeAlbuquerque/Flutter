import 'package:converso_moeda/app/model/moeda.dart';
import 'package:flutter/material.dart';

class Componente extends StatelessWidget {
  TextEditingController controle = TextEditingController();
  List<Moeda> lista = [];
  Moeda? selecionado;
  void Function(Moeda?)? funcao;

  Componente({required this.controle, required this.lista, required this.selecionado, required this.funcao});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(children: [
        Expanded(
            flex: 1,
            child: SizedBox(
              height: 63,
              child: DropdownButton<Moeda>(isExpanded: true,
               value: selecionado,
               underline: Container(height: 1, color: Colors.yellow),
                items: lista.map((element) => DropdownMenuItem(value:element,child:Text(element.nome))).toList(), 
                onChanged:funcao),
            )),
        const SizedBox(
          width: 25,
        ),
        Expanded(
            flex: 4,
            child: TextField(
                controller: controle, decoration: const InputDecoration(enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.yellow)), focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.yellow)))))
      ]),
    );
  }
}
