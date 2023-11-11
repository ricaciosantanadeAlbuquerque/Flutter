import 'package:converso_moeda55/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class EntradaSaida extends StatelessWidget {
  final List<CurrencyModel> listCurrencyModel;
  final TextEditingController controller;
  final CurrencyModel selectedItem;
  final void Function(CurrencyModel?)? onChanged;

  const EntradaSaida({super.key, required this.listCurrencyModel, required this.controller, required this.onChanged,required this.selectedItem});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 63,
            child: DropdownButton<CurrencyModel>(
              value: selectedItem,
              iconDisabledColor: Colors.amberAccent,
              isExpanded: true,
              underline: Container(height: 1, color: Colors.amberAccent),
              items: listCurrencyModel
                  .map((element) => DropdownMenuItem(
                        value: element,
                        child: Text(element.name),
                      ))
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          flex: 4,
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.amberAccent,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
