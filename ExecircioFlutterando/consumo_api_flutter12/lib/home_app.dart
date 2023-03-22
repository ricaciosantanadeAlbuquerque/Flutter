import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Api.dart';
class HomeApp extends StatefulWidget {
  @override
  State<HomeApp> createState() {
    return Estado();
  }
}

class Estado extends State<HomeApp> {
  ValueNotifier<bool> inLoard = ValueNotifier(false);
  ValueNotifier<List<Api>> lista = ValueNotifier([]);
   Future consumo()async{
    var cliente = http.Client();
    try{
      inLoard.value = true;
     var resposta = await cliente.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
     var decodeResposta = jsonDecode(resposta.body) as List;
     lista.value = decodeResposta.map((json) => Api.fromJson(json)).toList();
     await Future.delayed(const Duration( seconds: 2));
    }catch(e){
      throw Exception('ERRO! não foi possível consumir esta API');
      }finally{
        cliente.close();
        inLoard.value = false;
      }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Center(
          child:SingleChildScrollView(
            child: Padding(
              padding:const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment:MainAxisAlignment.center,
                children:[
                  AnimatedBuilder(
                    animation:Listenable.merge([lista,inLoard]),
                    builder:(_,__){
                        return inLoard.value ? const CircularProgressIndicator(): ListView.builder(
                          shrinkWrap:true,
                          physics:const NeverScrollableScrollPhysics(),
                          itemCount:lista.value.length,
                          itemBuilder:(context,index){
                            return ListTile(
                              title: Text(lista.value[index].toString())
                            );
                          }
                          );
                    }
                  ),
                const SizedBox(height:15),
                ElevatedButton(
                  style:ElevatedButton.styleFrom(
                  backgroundColor:Colors.green,
                  shape:RoundedRectangleBorder(
                    borderRadius:BorderRadius.circular(40)
                  )
                  ),
                  onPressed:consumo,
                  child: const Text("Cosumir"),
                  )
                ]
              ),
            ),
          )
        )
    );
  }
}
