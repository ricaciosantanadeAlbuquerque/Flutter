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
    return MaterialApp(theme: ThemeData(primarySwatch: Colors.green), home: const Inicio());
  }
}

//==============================================================================================================
class Inicio extends StatefulWidget {
  const Inicio({super.key});
  @override
  State<Inicio> createState() => Estado();
}

//==============================================================================================================
class Estado extends State<Inicio> {

  ValueNotifier<List<Api>> objeto = ValueNotifier<List<Api>>([]);
  ValueNotifier<bool> inLoard = ValueNotifier<bool>(false);

  Future consumo() async {
    var cliente = http.Client();
    try {
      inLoard.value = true;
      var resposta = await cliente.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
      var decode = jsonDecode(resposta.body) as List;
      //print(decode);
       objeto.value = decode.map((json) => Api.fromJson(json)).toList();
       await Future.delayed(const Duration(seconds: 2));
    } catch (e) {
      throw Exception("ERRO! não foi possível consumir esta API !");
    } finally {
      cliente.close();
      inLoard.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Padding(
      padding: const EdgeInsets.all(12),
      child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, 
        children: [
          AnimatedBuilder(
            animation: Listenable.merge([objeto,inLoard]),
           builder: (_,__){
            return inLoard.value ? const CircularProgressIndicator() :  ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: objeto.value.length,
                        itemBuilder: (_, index) {
                          return ListTile(
                            title: Text(objeto.value[index].id.toString()),
                          );
                        },
                      );
           }),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))),
            onPressed:consumo,
            child: const Text("Botão"),
          )
        ]),
      ),
    )));
  }
}


class Api {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Api({required this.userId, required this.id, required this.title, required this.completed});

  factory Api.fromJson(Map<String, dynamic> json) {
    return Api(userId: json['userId'], id: json['id'], title: json['title'], completed: json['completed']);
  }

  Map<String, dynamic> toJson() {
    return {
      'UserId': userId,
      'id': id,
      'title': title,
      'completed': completed,
    };
  }

  String toString() => 'userId: $userId, id:$id, title:$title, completed:$completed ';
}

/**
 * "userId": 1,
    "id": 1,
    "title": "delectus aut autem",
    "completed": false
 */