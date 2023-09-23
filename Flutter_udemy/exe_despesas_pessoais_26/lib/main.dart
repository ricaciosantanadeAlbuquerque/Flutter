import 'dart:math';
import 'package:intl/intl.dart';
import 'package:exe_despesas_pessoais_26/models/transaction.dart';
import 'package:flutter/material.dart';

void main() => runApp(const ExpensesApp());

//===========================StatelessWidget===============================================
class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: const MyHomeApp(),
    );
  }
}

// ===========================StatefulWidget===================================
class MyHomeApp extends StatefulWidget {
  const MyHomeApp({super.key});

  @override
  State<MyHomeApp> createState() => MyHomeAppState();
}

class MyHomeAppState extends State<MyHomeApp> {
  final title = TextEditingController();
  final value = TextEditingController();

  final List<Transaction> listaTransaction = [
    Transaction(id: Random().nextDouble().toString(), title: 'Novo Tênis de corrida', value: 310.76, date: DateTime.now()),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 211.30, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Despesas Pessoais'),
      actions:[
        IconButton(onPressed: (){},icon:const Icon(Icons.add))
      ],),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Card(
            elevation: 5,
            color: Colors.blue,
            child: Text('Gráfico'),
          ),
          SizedBox(
            height: 330,
            child: listaTransaction.isEmpty
                ? Column(
                    children: [
                      const SizedBox(height: 10),
                      const Text('Nenhuma Transação Cadastrada'),
                      const SizedBox(height: 10),
                      Container(
                        height: 250,
                      ),
                    ],
                  )
                : ListView.builder(
                    itemCount: listaTransaction.length,
                    itemBuilder: (_, index) {
                      final TRS = listaTransaction[index];
                      return Card(
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 15,
                              ),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: Colors.purple,
                                ),
                              ),
                              child: Text(
                                'R\$ ${TRS.value.toStringAsFixed(2)}',
                                style: const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  TRS.title,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  DateFormat('d MMM y').format(TRS.date),
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
          ),
          Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  TextField(
                    controller: title,
                    decoration:const InputDecoration(
                      labelText: 'Título'
                    )
                  ),
                  TextField(
                    controller:value,
                    decoration:const InputDecoration(
                      labelText:'valor (R\$)'
                    )
                  ),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.end,
                    children: [TextButton(onPressed: () {

                    }, child: const Text('Nova Transação',
                    style:TextStyle(
                        color: Colors.purple
                    )
                    ,)
                    ,),
                    ],
                    ),
                ],
                ),
              ),
              )
        ],
      ),
      floatingActionButton:FloatingActionButton(
        onPressed:(){},
        child:const Icon(Icons.add)
      ),
      floatingActionButtonLocation:FloatingActionButtonLocation.centerFloat,
    );
  }
}
