import 'package:flutter/material.dart';

void main() {}

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MyHomeApp();
  }
}

class MyHomeApp extends StatelessWidget {
  const MyHomeApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text('Despesas Pessoais')
      ),
      body:Column()
    );
  }
}
