import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm({super.key});

  @override
  TransactionFormState createState() => TransactionFormState();
}

class TransactionFormState extends State<TransactionForm> {

  final title = TextEditingController();
  final value = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            TextField(
              controller:title,
              decoration: const InputDecoration(
                labelText: 'Título',
              )
            ),
            TextField(
              controller: value,
              decoration: const InputDecoration(
                labelText: 'Valor (R\$)'
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text('Nova Transaction',
                  style: TextStyle(
                    color:Colors.purple
                  ),),
                ),
              ],
            ),
          ],),
        ),
        );
  }
}
