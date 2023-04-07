import 'package:converso_moeda02/src/model/moeda.dart';
import 'package:flutter/material.dart';

class Components extends StatelessWidget {
  TextEditingController controle = TextEditingController();
  List<Moeda> lista = [];
  Moeda selecionar;
   void Function(Moeda?)? onChanged;


  Components({required this.controle,required this.lista,required this.selecionar,required this.onChanged});
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        flex: 1,
        child: SizedBox(
          height: 63,
          child: DropdownButton<Moeda>(
               value: selecionar,
              isExpanded: true,
              iconEnabledColor: Colors.amberAccent,
              underline: Container(
                height: 1,
                color: Colors.amberAccent,
              ),
              items: lista.map((element) => DropdownMenuItem(value: element,child: Text(element.name))).toList(),
              onChanged: onChanged,
        ),
      ),
      ),
      const SizedBox(width: 10),
      Expanded(
          flex: 4,
          child: TextField(
              controller: controle,
              decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.amberAccent),
                  ),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.amberAccent)))))
    ]);
  }
}
