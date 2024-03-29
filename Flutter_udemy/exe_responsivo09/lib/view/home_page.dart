import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/chart.dart';
import '../components/transaction_form.dart';
import '../components/transaction_list.dart';
import '../model/transaction.dart';
import 'dart:io';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final List<Transaction> listTransaction = [Transaction(id: Random().nextDouble().toString(), title: 'conta de luz', value: 55, date: DateTime.now())];
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

  Widget getIconButton( Function() fn, IconData icon) {
    return Platform.isIOS ? GestureDetector(onTap: fn, child: Icon(icon)) : IconButton(onPressed: fn, icon: Icon(icon));
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final paisagem = mediaQuery.orientation == Orientation.landscape;
    final actions = [
      if (paisagem)
        getIconButton(
           () {
            setState(() {
              showChart = !showChart;
            });
          },
         showChart ? Icons.list : Icons.show_chart
        ),
      getIconButton(
        () {
          opeTransactionFormModal(context);
        },
         Platform.isIOS ? CupertinoIcons.add  :Icons.add,
      ),
    ];

    final appBar = AppBar(
      title: const Text(
        'Despesas Pessoais',
      ),
      actions: actions,
    );

    final altura = mediaQuery.size.height - appBar.preferredSize.height - mediaQuery.padding.top;

    final bodyPage = SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (paisagem)
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(showChart ? 'Mostrando o Gráfico' : 'Mostrando a lista'),
              Switch.adaptive(
                  activeColor: Theme.of(context).colorScheme.secondary,
                  value: showChart,
                  onChanged: (value) {
                    setState(() {
                      showChart = value;
                    });
                  })
            ]),
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
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(middle: const Text('Despesas Pessoais'), trailing: Row(children: actions)),
            child: bodyPage,
          )
        : Scaffold(
            appBar: appBar,
            body: bodyPage,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    onPressed: () {
                      opeTransactionFormModal(context);
                    },
                    child: const Icon(Icons.add),
                  ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          );
  }
}
