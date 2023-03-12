import 'dart:convert';

import 'package:consumo_api_flutter06/Consumo_api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() {
    return Estado();
  }
}

class Estado extends State<Inicio> {

  ValueNotifier<List<ObjetoApi>> lista = ValueNotifier<List<ObjetoApi>>([]);
  ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);

  Future consumo() async {
    var cliente = http.Client();
    try {
      inLoader.value = true;
      var resposta = await cliente.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
      var decode = jsonDecode(resposta.body) as List;
       lista.value = decode.map((element) => ObjetoApi.fromJson(element)).toList();
      await Future.delayed(const Duration(seconds:2));
    } catch (e) {
      throw Exception("ERRO! não foi possível consumir esta API");
    } finally {
      cliente.close();
      inLoader.value = false;
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
                    AnimatedBuilder(
                      animation: Listenable.merge([lista,inLoader]),
                     builder: (_,__){
                      return  inLoader.value ? const CircularProgressIndicator() : ListView.builder(
                      physics: const NeverScrollableScrollPhysics(), 
                      shrinkWrap:true,
                      itemCount: lista.value.length,
                      itemBuilder: (_, index) {
                        return ListTile(title: Text(lista.value[index].title));
                      },
                    );
                     }),
            
                    ElevatedButton(style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)
                    )
                    ), onPressed: consumo,
                     child: const Text("Botão")
                     )
                     ]
                     ),
            )
                   )
                   );
  }
}
