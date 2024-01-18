import 'dart:math';

import 'package:flutter/material.dart';
import '../components/chart.dart';
import '../components/transaction_form.dart';
import '../components/transaction_list.dart';
import '../model/transaction.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final List<Transaction> listTransaction = [
    // Transaction(id: Random().nextDouble().toString(), title: 'conta de luz', value: 55, date:DateTime.now())
  ];

  bool _showChart = false;

  void addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(id: Random().nextDouble().toString(), title: title, value: value, date: date);

    setState(() {
      listTransaction.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  opeTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(onSubmitted: addTransaction); // comunicação indireta
        });
  }

  List<Transaction> get recentTransaction {
    return listTransaction.where((trs) {
      return trs.date.isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  removeTransactio(String id) {
    print("===============================================${id} ===================================================");
    setState(() {
      listTransaction.removeWhere((trs) {
        return trs.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text(
        'Despesas Pessoais',
      ),
      actions: [
        IconButton(
          onPressed: () {
            opeTransactionFormModal(context);
          },
          icon: const Icon(Icons.add),
        ),
      ],
    );

    final altura = MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
              const Text('Exibindo o gráfico'),
              Switch(
                  value: _showChart,
                  onChanged: (value) {
                    setState(() {
                      _showChart = value;
                    });
                  })
            ]),
            if(_showChart)
            SizedBox(
              height: altura * 0.25,
              child: Chart(
                listaTransaction: recentTransaction,
              ),
            ),
            if(!_showChart)
            SizedBox(
              height: altura * 0.75,
              child: TransactionLits(
                listTransaction: listTransaction,
                onSubmitted: removeTransactio,
              ),
            ), // comunicação dirate / comunicação indireta
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          opeTransactionFormModal(context);
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
