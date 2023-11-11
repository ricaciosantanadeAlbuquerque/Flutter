import 'package:flutter/material.dart';

import '../models/currency_model.dart';

class EntradaSaida extends StatelessWidget {
  final List<CurrencyModel> listCurrencyModel;
  final TextEditingController controller;
  final void Function(CurrencyModel?)? onChanged;
  final CurrencyModel selectedItem;

  const EntradaSaida({super.key, required this.controller,required this.listCurrencyModel,required this.onChanged,required this.selectedItem});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 63,
            child: DropdownButton(
                 value: selectedItem,
                isExpanded: true,
                iconDisabledColor: Colors.amberAccent,
                underline: Container(height: 1, color: Colors.amberAccent),
                items: listCurrencyModel.map((e) => DropdownMenuItem(value: e, child: Text(e.name))).toList(),
                onChanged: onChanged),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          // O TextField() dentro de uma Row() produz um erro, é necessário dar um tamaho fixo ou expandi-ló
          flex: 4,
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.amberAccent,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.amberAccent),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
