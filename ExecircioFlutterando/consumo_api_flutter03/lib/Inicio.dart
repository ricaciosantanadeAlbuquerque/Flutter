import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Api.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() {
    return InicioState();
  }
}

class InicioState extends State<Inicio> {
  ValueNotifier<List<Api>> listaAp = ValueNotifier<List<Api>>([]);
  ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);

  consumo() async {
    var cliente = http.Client();
    try {
      inLoader.value = true;
      var resposta = await cliente.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
      var decode = jsonDecode(resposta.body) as List;
      listaAp.value = decode.map((element) => Api.fromJSON(element)).toList();
      await Future.delayed(const Duration(seconds:2));
    } catch (e) {
    } finally {
      cliente.close();
      inLoader.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(
                child: SingleChildScrollView(
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                AnimatedBuilder(
                    animation: Listenable.merge([listaAp,inLoader]),
                    builder: (_, __) {// ternario
                      return inLoader.value ? const CircularProgressIndicator(): ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: listaAp.value.length,
                              itemBuilder: (_, index) {
                                return ListTile(
                                  title: Text(listaAp.value[index].toString()),
                                );
                              },
                            );
                    }),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)
                  )
                  ), onPressed: consumo,
                   child: const Text("Custom BTN")
                   )
              ]),
            )
            )
            )
            );
  }
}
