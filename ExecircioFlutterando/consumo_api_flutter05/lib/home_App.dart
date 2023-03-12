import 'dart:convert';

import 'package:consumo_api_flutter05/consumo_api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});


  @override
  State<HomeApp> createState() {
    return Estado();

  }
}

class Estado extends State<HomeApp> {
ValueNotifier<List<ApiConsumo>> lista = ValueNotifier<List<ApiConsumo>>([]);
  Future consumo()async{

    var cliente = http.Client();
    try{
    var resposta = await cliente.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    var decode = jsonDecode(resposta.body) as List;
     lista.value = decode.map((element) => ApiConsumo.fromJson(element)).toList();
     print(lista.value);
    }catch(e){
      throw Exception('Erro! não foi possível consumir esta API ');
    }finally{
      cliente.close();
    }
  }

@override
Widget build(BuildContext context){
 return Scaffold(
       body:Center(
        child:SingleChildScrollView(
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              ValueListenableBuilder(
                valueListenable: lista,
                builder:(context, value, child) {
                  return ListView.builder(
                    shrinkWrap:true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(value[index].title),
                      );
                    },
        
                  );
                },
                ),
              ElevatedButton(
                style:ElevatedButton.styleFrom(
        
                  backgroundColor: Colors.green,
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)
                  )
        
                ),
                onPressed: consumo
                ,child: const Text("Botão")
              
              )
            ]
          ),
        )
       )
 );
}
}
