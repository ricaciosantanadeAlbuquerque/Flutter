import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Meu App",
      theme: ThemeData(
        primarySwatch:Colors.green,
      ),
      home: const Inicio()
    );
  }
}


class Inicio extends StatefulWidget{
const Inicio({super.key});

            @override
   Estado createState() => Estado();
}


class Estado extends State<Inicio>{
//ValueNotifier lista = new ValueNotifier([]);

 Future consumo()async{
  var cliente = http.Client();

  try{
    var resposta = await cliente.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    var decode = jsonDecode(resposta.body) as List;
    print(decode);
  }catch(e){
    throw Exception("NÃO FOI POSSÍVEL COMSUMIR ESTA API");

    }finally{
      cliente.close();
    }
 }
  @override
Widget build(BuildContext context){
  return Scaffold(
    body:Center(
      child:Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
         /* ValueListenableBuilder(builder:(context,value,child){
            return ListView.builder(
              itemCount: lista.value,
              itemBuilder: (BuildContext,index){
                  return ListTile(
                    title: Text(lista.value[index]),
                  );
              });
          }, valueListenable: lista.value,),*/
          ElevatedButton(
            onPressed:consumo,
            child: const Text("Ativar"),
            style:ElevatedButton.styleFrom(
              backgroundColor:Colors.green,
              shape:RoundedRectangleBorder(
                borderRadius:BorderRadius.circular(40)
              )
            )
          )
        ],
      )
    )
  );
}
}


