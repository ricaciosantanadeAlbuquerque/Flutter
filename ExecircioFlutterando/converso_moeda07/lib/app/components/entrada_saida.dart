import 'package:flutter/material.dart';

import '../models/currency_model.dart';

class EntradaSaida extends StatelessWidget {
  final List<CurrencyModel> listCurrencyModel;
  final CurrencyModel isSelected;
  final TextEditingController controller;
  final void Function(dynamic)? onChanged;
  const EntradaSaida({super.key, required this.listCurrencyModel, required this.isSelected, required this.controller, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 63,
            child: DropdownButton(
              value: isSelected,
              iconEnabledColor: Colors.amberAccent,
              isExpanded: true,
              underline: Container(color: Colors.amberAccent, height: 1),
              items: listCurrencyModel.map((element) {
                return DropdownMenuItem(
                  value: element,
                  child: Text(element.name),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          flex: 3,
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.amberAccent),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
