import 'dart:convert';

import 'package:consumo_api_flutter01/json_objeto.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  ValueNotifier<List<Api>> listAp = new ValueNotifier<List<Api>>([]);
  ValueNotifier<bool> inLoader = new ValueNotifier(false);

  Future callApi() async {
    var cliente = http.Client();
    try {
      inLoader.value = true;
      var resposta = await cliente.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
      var decodificar = jsonDecode(resposta.body) as List;
      listAp.value = decodificar.map((e) => Api.fromJson(e)).toList();
      await Future.delayed(const Duration(seconds: 2));
    } catch (e) {
      throw Exception("Não foi possível consumir esta API.");
    } finally {
      inLoader.value = false;
      cliente.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: SingleChildScrollView(
                child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                  AnimatedBuilder(
                      animation: Listenable.merge([listAp,inLoader]),
                      builder: (_, __) => inLoader.value ? CircularProgressIndicator() : ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: listAp.value.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(listAp.value[index].title),
                                );
                              })
                          ),
                  ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green), onPressed: callApi, child: const Text("BTN"))
                ]),
              ),
            )));
  }
}
