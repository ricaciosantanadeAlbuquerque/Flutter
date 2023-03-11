import 'dart:convert';

import 'package:http/http.dart' as http;

Future<void> main() async {
  var resposta = await consumo();
  print(resposta.id);
  print(resposta.toJson());
  print(resposta.toString());
}

Future<Api> consumo() async {
  var cliente = http.Client();

  try {
    var resposta = await cliente.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
    var decodidicar = jsonDecode(resposta.body);
    var api = Api.fromJson(decodidicar);
    return api;
  } catch (e) {
    throw Exception("Não foi possível consumir está API ");
  } finally {
    cliente.close();
  }
}
/**
 *  "userId": 1,
 * "id": 1,
 * "title": "delectus aut autem",
 * "completed": false
 */

class Api {
  final int userId;
  final int id;
  final String title;
  final bool completd;

  Api({required this.userId, required this.id, required this.title, required this.completd});

  factory Api.fromJson(Map json) {
    return Api(userId: json["userId"], id: json["id"], title: json["title"], completd: json["completed"]);
  }

  Map toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'completd': completd,
    };
  }

  @override
  String toString() {
    return 'userId $userId,id: $id, title $title, completed: $completd';
  }
}
