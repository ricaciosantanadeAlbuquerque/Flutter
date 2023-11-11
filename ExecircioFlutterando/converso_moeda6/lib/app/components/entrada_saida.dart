import 'package:flutter/material.dart';

class EntradaSaida extends StatelessWidget {
  final TextEditingController controller;

  const EntradaSaida({super.key, required this.controller});
  
 @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 63,
            child: DropdownButton(isExpanded: true, iconDisabledColor: Colors.amberAccent, underline: Container(height: 1, color: Colors.amberAccent), items: [], onChanged: (value) {}),
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
