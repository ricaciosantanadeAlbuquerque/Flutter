import 'package:exe_despesas_pessoais_06/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {

  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:  MyHomeApp()
    );
  }
}

class MyHomeApp extends StatelessWidget {

 final titulo = TextEditingController();
 final valor  =  TextEditingController();
 final List<Transaction> listaTransaction =  [
 Transaction(id: 't1', title:'Tênis para corrida', value: 310.76, date: DateTime.now()),
 Transaction(id: 't2', title: 'Conta de lUz', value: 233.3, date: DateTime.now())
];
   MyHomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:const Text('Despesas Pessoais')
      ),
      body:Column(
        mainAxisAlignment:MainAxisAlignment.start,
        crossAxisAlignment:CrossAxisAlignment.stretch,
        children:[
          const Card(
            color: Colors.blue ,
            elevation:5,
            child:Text(
              'Gráfico',
              style: TextStyle(
                fontWeight:FontWeight.bold,
                fontSize:16
              ),)
          ),
          Column(
            children: listaTransaction.map((transac){
              return Card(
                elevation:5,
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal:15,
                        vertical:10
                      ),
                      padding: const EdgeInsets.all(10),
                      decoration:  BoxDecoration(
                        border:Border.all(
                          width:2,
                          color:Colors.purple
                        )
                      ),
                      child:Text(
                        'R\$ ${transac.value.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontWeight:FontWeight.bold,
                          fontSize:16,
                          color:Colors.purple
                        )
                      )
                    ),
                    Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children:[
                        Text(
                          transac.title,
                          style:const TextStyle(
                            fontWeight:FontWeight.bold,
                            fontSize:16
                          )),
                        Text(DateFormat('d MMM y').format(transac.date))
                      ]
                    )
                  ]
                )
              );
            }).toList(),
          ),
          Card(
            elevation:5,
            child:Padding(
              padding:const EdgeInsets.all(10),
              child: Column(
                children:[
                  TextField(
                    controller:titulo,
                    decoration: const InputDecoration(
                      labelText:'Título'
                    )
                  ),
                  TextField(
                    controller:valor,
                    decoration:const InputDecoration(
                      labelText:'Valor'
                    )
                  ),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.end,
                    children: [
                      TextButton(onPressed: () {
                      print(titulo.text);
                      print(valor.text);
                    }, child: const Text(
                      'Nova Transação',
                      style:TextStyle(color:Colors.purple)
                      ),
                      ),
                      ])
                ]
              ),
            )
          )
        ]
      )
    );
  }
}
