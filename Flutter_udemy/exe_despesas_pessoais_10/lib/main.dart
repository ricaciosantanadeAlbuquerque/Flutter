
import 'package:exe_despesas_pessoais_10/components/transaction_use.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(const ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(home: HomeApp());
  }
}

class HomeApp extends StatelessWidget {
 

   HomeApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Despesas Pessoais')
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.stretch,
            children: const [
           Card(elevation: 5, color: Colors.blue, child: Text('Gráfico'),
            ),
            TransactionUser()
            
          ],),
        ),);
  }
}
