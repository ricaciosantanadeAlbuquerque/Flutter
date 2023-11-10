import 'package:flutter/material.dart';

class EntradaSaida extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 63,
            child: DropdownButton(
              iconDisabledColor: Colors.amberAccent,
              isExpanded: true,
              underline: Container(height: 1, color: Colors.amberAccent),
              items: const [
                DropdownMenuItem(
                  child: Text('Real'),
                ),
              ],
              onChanged: (value) {},
            ),
          ),
        ),
        const SizedBox(width: 20),
        const Expanded(
          flex: 4,
          child: TextField(
            decoration: InputDecoration(
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
