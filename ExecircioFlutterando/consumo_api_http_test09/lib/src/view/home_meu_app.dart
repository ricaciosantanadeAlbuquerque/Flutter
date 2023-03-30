import 'package:consumo_api_http_test09/src/controller/controle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});
  @override
  State<HomeApp> createState() => EstadoApp();
}

class EstadoApp extends State<HomeApp> {
  Controle controle = Controle();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            child: Padding(
                padding: const EdgeInsets.all(12),
                child: SingleChildScrollView(
                  child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       ValueListenableBuilder(
              valueListenable: controle.carregando,
              builder: (_,value,__){ 
                  return (controle.carregando.value)
                    ? const CircularProgressIndicator()
                    : ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controle.lista.value.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(controle.lista.value[index].id.toString()),
                          );
                        },
                      );
              }, ),
                               const SizedBox(height:15)                ,
                            ElevatedButton.icon(onPressed: (){
                              controle.iniciar();
                            }, 
                            icon: const Icon(Icons.refresh_outlined), 
                            label:const Text("Carregar"))
                      ]
                      ),
                ),
                
                )
                ),
      )
              );
    
  }
}
