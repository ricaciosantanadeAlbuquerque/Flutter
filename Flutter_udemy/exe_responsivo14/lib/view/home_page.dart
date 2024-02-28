import 'dart:math';
import 'package:exe_responsivo14/components/chart.dart';
import 'package:flutter/material.dart';
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
  bool showChart = false;

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
    // print("===============================================${id} ===================================================");
    setState(() {
      listTransaction.removeWhere((trs) {
        return trs.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final paisagem = mediaQuery.orientation == Orientation.landscape;
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
    final altura = mediaQuery.size.height - appBar.preferredSize.height - mediaQuery.padding.top;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Despesas Pessoais',
        ),
        actions: [
          if (paisagem)
            IconButton(
                icon: Icon(showChart ? Icons.list : Icons.show_chart),
                onPressed: () {
                  setState(() {
                    showChart = !showChart;
                  });
                }),
          IconButton(
            onPressed: () {
              opeTransactionFormModal(context);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (paisagem)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(showChart ? 'Mostrando o Gráfico' : 'Mostrando A Lista'),
                  Switch(
                      value: showChart,
                      onChanged: (valeu) {
                        setState(() {
                          showChart = valeu;
                        });
                      }),
                ],
              ),
            if (showChart || !paisagem)
              SizedBox(
                height: altura * (paisagem ? 0.80 : 0.25),
                child: Chart(
                  listaTransaction: recentTransaction,
                ),
              ),
            if (!showChart || !paisagem)
              SizedBox(
                height: altura * (paisagem ? 1 : 0.75),
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
