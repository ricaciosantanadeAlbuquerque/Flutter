import 'package:exe_despesas_pessoais_07/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(home: MyHomeApp());
  }
}

class MyHomeApp extends StatelessWidget {
  final title = TextEditingController();
  final value = TextEditingController();
  final listaTransaction = [
    Transaction(id: 't1',title: 'Tênis de corrida',value: 310.76,date:DateTime.now()),
    Transaction(id: 't2', title: 'Conta de luz', value: 210.3, date:DateTime.now())
  ];
   MyHomeApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:const Text('Despesas Pessoais')
      ),
      body: Column(
        crossAxisAlignment:CrossAxisAlignment.stretch,
        children:[
          const Card(
            color:Colors.blue,
            elevation:5,
            child: Text('Gráfico')
          ),
          Column(
            children: listaTransaction.map((transac){
              return Card(
                child:Row(
                  children:[
                    Container(
                      margin:const EdgeInsets.symmetric(
                        horizontal:15,
                        vertical:10
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width:2,
                          color: Colors.purple
                        )
                      ),
                      padding: const EdgeInsets.all(10),
                      child:Text(
                        'R\$ ${transac.value.toStringAsFixed(2)}',
                        style:const TextStyle(
                          fontSize:20,
                          color:Colors.purple,
                          fontWeight:FontWeight.bold
                        ))
                    ),
                    Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children:[
                        Text(
                        transac.title,
                        style:const TextStyle(
                          fontWeight:FontWeight.bold,
                          fontSize:16
                          )
                          ),
                        Text(
                          DateFormat('d MMM y').format(transac.date),
                          style:const TextStyle(
                            color:Colors.grey
                            )
                            )
                      ]
                    )
                  ]
                )
              );
            }
          ).toList()
          ),
          Card(
            child:Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children:[
                  TextField(
                    controller: title,
                    decoration:const InputDecoration(
                      labelText:'Título'
                    )
                  ),
                  TextField(
                    controller:value,
                    decoration: const InputDecoration(
                      labelText:'Valor (R\$)'
                    )
                  ),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: (){
                          print(title.text);
                          print(value.text);
                        },
                        child: const Text('Nova Transação',
                        style: TextStyle(color: Colors.purple),
                        ),
                        ),
                    ],
                  )
                ]
              ),
            )
          )
        ]
      )
    );
  }
}
