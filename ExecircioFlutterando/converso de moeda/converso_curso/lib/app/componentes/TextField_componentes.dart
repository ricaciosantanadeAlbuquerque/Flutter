import 'package:converso_curso/app/model/moeda_modelo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextComponentes extends StatelessWidget {

    List<MoedaModelo> item;
    MoedaModelo selecionar;
   final TextEditingController controller;
   final Function(MoedaModelo?) onChanged;

   TextComponentes({super.key, required this.item, required this.controller,required this.onChanged, required this.selecionar});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(children: <Widget>[
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 63,
            child: DropdownButton<MoedaModelo>(
                iconEnabledColor: Colors.amber,
                underline: Container(height: 1, color: Colors.amber),
                isExpanded: true,
                value: selecionar,
                items: item.map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(e.nome))).toList(),
                onChanged: onChanged),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          flex: 4,
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.amber)
                ), focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.amber)))),
        )
      ]),
    );
  }
}
