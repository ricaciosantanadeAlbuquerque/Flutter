import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'api.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});
  @override
  State<HomeApp> createState() {
    return Estado();
  }
}

class Estado extends State<HomeApp> {
  ValueNotifier<List<Api>> lista = ValueNotifier<List<Api>>([]);
  Future consumo() async {
    var cliente = http.Client();
    try {
      var resposta = await cliente.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
      var decodeResposta = jsonDecode(resposta.body) as List;
      lista.value = decodeResposta.map((elementJson) => Api.fromJson(json: elementJson)).toList();
      //print(lista);
    } catch (e) {
      throw Exception("ERRO! não foi possível consumir esta API ");
    } finally {
      cliente.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, 
                children: [
                    ValueListenableBuilder(valueListenable: lista , builder:(_,Value,__){
                    return ListView.builder(
                      physics:const NeverScrollableScrollPhysics(),
                      shrinkWrap:true,
                      itemCount: Value.length,
                      itemBuilder: (context,index){
              return ListTile(
                title: Text(Value[index].id.toString())
              );
                    });
                    }),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40)
              ),
                       backgroundColor: Colors.blue), 
                       onPressed: consumo,
              child: const Text("Consumir")
              )
                ]
                ),
            )
    )
    );
  }
}
