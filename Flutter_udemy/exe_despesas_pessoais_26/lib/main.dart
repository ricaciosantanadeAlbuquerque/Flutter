import 'dart:math';

import 'package:exe_despesas_pessoais_26/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components/chart.dart';
import 'components/transaction_form.dart';
import 'components/transaction_list.dart';

void main() => runApp(const ExpensesApp());

//===========================StatelessWidget===============================================
class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    /**
    *  SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);
     código para fixar a tela no modo retrato
    */
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Colors.purple,
              secondary: Colors.amberAccent,
            ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: const TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold, fontFamily: 'IBMPlexSans'),
            ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 25 * MediaQuery.of(context).textScaleFactor,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
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

// ===============================State================================
class MyHomeAppState extends State<MyHomeApp> {
  final List<Transaction> listaTransaction = [
    Transaction(id: Random().nextDouble().toString(), title: 'Novo Tênis de corrida', value: 310.76, date: DateTime.now().subtract(const Duration(days: 5))),
    Transaction(id: Random().nextDouble().toString(), title: 'Conta de Luz', value: 211.30, date: DateTime.now())
  ];

  bool _showChart = false;

  addTransaction(String title, double value,DateTime date) {
    final newTransaction = Transaction(id: Random().nextDouble().toString(), title: title, value: value, date:date);

    setState(() {
      listaTransaction.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  /**
     * Colocando  função  showModalBottomSheet() dentro de uma função da classe MyHomeAppState() eu a torno a visével em toda a classe, sendo que todos os botões apontaram para o mesmo lugar. Ou seja  'openTransactionFormModal()'
     */
  openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(onSubmitted: addTransaction); // comunicação indireta
        });
  }

  List<Transaction> get recentTransaction {
    return listaTransaction.where((trs) {
      return trs.date.isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  void removeTransaction(String id) {
    setState((){
       listaTransaction.removeWhere((trs) {
        return trs.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // se a orientação do dispositivo for igual ao modo paisagem

    final isLandScape = MediaQuery.of(context).orientation == Orientation.landscape;

    final appBar = AppBar(
      title: const Text('Despesas Pessoais'),
      actions: [
        if (isLandScape)
          IconButton(
            onPressed: () {
              setState(() {
                _showChart = !_showChart;
              });
            },
            icon: Icon(_showChart ? Icons.list : Icons.show_chart),
          ),
        IconButton(
            onPressed: () {
              openTransactionFormModal(context);
            },
            icon: const Icon(Icons.add))
      ],
    );
    final alturaDispositivo = MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (isLandScape)
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text('Exibir gráfico'),
                Switch(
                    value: _showChart,
                    onChanged: (value) {
                      setState(() {
                        _showChart = value;
                      });
                    }),
              ]),
            if (_showChart || !isLandScape)
              SizedBox(
                height: isLandScape ? alturaDispositivo * 0.80 : alturaDispositivo * 0.25,
                child: Chart(
                  listaTransaction: recentTransaction,
                ),
              ),

            if (!_showChart || !isLandScape)
              SizedBox(
                height: alturaDispositivo * 0.75,
                child: TransactionList(listaTransaction: listaTransaction,onRemove: removeTransaction,),
              ), // comunicação direta
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            openTransactionFormModal(context);
          },
          child: const Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
