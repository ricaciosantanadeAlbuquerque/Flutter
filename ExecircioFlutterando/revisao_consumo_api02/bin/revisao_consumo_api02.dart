import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

Future main(List<String> args) async {
  var resposta = await consumo();
  print(resposta.id);
  print(resposta.toJson());
}

Future<Api> consumo() async {
  var cliente = http.Client();
  Response resposta = await cliente.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
  var decodificar = jsonDecode(resposta.body);
  var api = Api.fromJson(decodificar);
  return api;
}

/**
 * {
  "userId": 1,
  "id": 1,
  "title": "delectus aut autem",
  "completed": false
}
 */

class Api {
  final int userId;
  final int id;
  final String title;
  final bool completed; // atribultos 'final' são inicializados em tempo de execução

  Api({required this.userId, required this.id, required this.title, required this.completed}); // construtor padrão

  factory Api.fromJson(Map json) {
    // recebe um Mapa retorna um objeto
    return Api(userId: json["userId"], id: json["id"], title: json["title"], completed: json['completed']);
  }

  Map toJson() {
    return {
      "UserId": userId,
      "id": id,
      "title": title,
      "completed": completed,
    };
  }
}
