import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'consumo_api.dart';
class Inicio extends StatefulWidget {

  const Inicio({super.key});

  @override
  State<Inicio> createState() {
    return InicioEstado();
  }
}

class InicioEstado extends State<Inicio> {
ValueNotifier<List<Api>> listaApi =  ValueNotifier([]);
ValueNotifier<bool> inLoader =  ValueNotifier(false);


 Future consumo()async{

 var cliente = http.Client();

 try{
  inLoader.value = true;
  var resposta = await cliente.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
  var decodeFicar = jsonDecode(resposta.body) as List; // typecast
  listaApi.value = decodeFicar.map((element) =>  Api.fromJson(element)).toList(); // para lista
  await Future.delayed(const Duration(seconds: 2));
 }catch(e){
  throw Exception("Não foi possível consumir esta API");
 }finally{
   cliente.close();
   inLoader.value = false;
 }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                AnimatedBuilder(
                  animation: Listenable.merge([listaApi,inLoader]),
                  builder:(_,__){
                    return inLoader.value ? CircularProgressIndicator() : ListView.builder(
                      shrinkWrap:true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: listaApi.value.length,
                      itemBuilder: (BuildContext, index){
                        return ListTile(
                          title: Text(listaApi.value[index].title),
                        );
                      },
                  
                      );
                  }
                  ),
                
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(40)
                    )
                  ),
                  onPressed: consumo,
                  child:const Text("Custom BTN")
                )
              ]
            ),
          ),
        )
      ),
    );
  }
}
