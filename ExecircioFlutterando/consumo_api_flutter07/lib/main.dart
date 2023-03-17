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
          primarySwatch: Colors.green,
        ),
        home: const Inicio());
  }
}

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  Estado createState() => Estado();
}

class Estado extends State<Inicio> {

ValueNotifier<List<Api>> lista =  ValueNotifier([]);

  Future consumo() async {
    var cliente = http.Client();

    try {
      var resposta = await cliente.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
      var decode = jsonDecode(resposta.body) as List;
      lista.value = decode.map((json) => Api.fromJson(json)).toList();
    } catch (e) {
      throw Exception("NÃO FOI POSSÍVEL COMSUMIR ESTA API");
    } finally {
      cliente.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding:const EdgeInsets.all(12),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       ValueListenableBuilder(
                        valueListenable: lista,
                        builder:(context,value,child){
                return ListView.builder(
                 physics :NeverScrollableScrollPhysics(),
                 shrinkWrap: true,
                  itemCount: lista.value.length,
                  itemBuilder: (_,index){
                      return ListTile(
                        title: Text(lista.value[index].toString()),
                      );
                  });
                        }, ),
                      ElevatedButton(onPressed: consumo, child: const Text("Ativar"), style: ElevatedButton.styleFrom(backgroundColor: Colors.green, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))))
                    ],
                  ),
              ),
            )));
  }
}

class Api {
  final int userId;
  final int id;
  final String title;
  final bool completd;

  Api({required this.userId, required this.id, required this.title, required this.completd});

  factory Api.fromJson(Map<String, dynamic> json) {
    return Api(userId: json['userId'], id: json['id'], title: json['title'], completd: json['completed']);
  }

  Map<String, dynamic> toJson() {
    return {'userId': userId, 'id': id, 'title': title, 'completed': completd};
  }
   @override
  String toString() => 'id: $id';
}

/**
 *  "userId": 1,
    "id": 1,
    "title": "delectus aut autem",
    "completed": false
 */