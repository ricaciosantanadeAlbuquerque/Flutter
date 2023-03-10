import 'dart:convert';

import 'package:http/http.dart' as http;

Future<void> main() async {
  var resposta = await consumo();
  print(resposta.id);
  print(resposta.toJson());
}

// CONSUMINDO UMA API
Future<Api> consumo() async {
  var cliente = http.Client();
  try {
    var resposta = await cliente.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
    var decoficar = jsonDecode(resposta.body);
    var api = Api.formJson(decoficar);
    return api;
  } catch (e) {
    throw Exception("Falha ao consumir está API ");
  } finally {
    cliente.close();
  }
}

// MAPEANDO PARA OBJETO

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
  final bool completed;

  Api({required this.userId, required this.id, required this.title, required this.completed});

  factory Api.formJson(Map json) {
    return Api(userId: json["userId"], id: json["id"], title: json["title"], completed: json["completed"]);
  }

  Map toJson() {
    return {'userId': userId, 'id': id, 'title': title, 'completed': completed};
  }
}
