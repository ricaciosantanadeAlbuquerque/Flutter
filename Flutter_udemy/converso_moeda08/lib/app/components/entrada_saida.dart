import 'package:converso_moeda08/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class EntradaSaida extends StatelessWidget {
   final List<CurrencyModel> listaCurrencyModel;
  final TextEditingController controlle;
  final CurrencyModel isSelected;
  final void Function(CurrencyModel?)? onChanged; 

  const EntradaSaida({super.key, required this.controlle, required this.listaCurrencyModel, required this.isSelected, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        flex: 1,
        child: SizedBox(
          height: 64,
          child: DropdownButton(
            isExpanded:true,
            underline:Container(height:1,color:Colors.amberAccent),
            value:isSelected,
            items: listaCurrencyModel.map((currency) {
              return DropdownMenuItem(value: currency, child: Text(currency.name));
            }).toList(),
            onChanged: onChanged,
          ),
        ),
      ),
      const SizedBox(width: 25,),
      Expanded(
        flex: 4,
        child: TextField(
          controller: controlle,
          decoration: const InputDecoration(
            enabledBorder:UnderlineInputBorder(
              borderSide:BorderSide(
                color:Colors.amberAccent,
              ),
            ),
            focusedBorder:UnderlineInputBorder(
              borderSide:BorderSide(
                color: Colors.amberAccent,
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
