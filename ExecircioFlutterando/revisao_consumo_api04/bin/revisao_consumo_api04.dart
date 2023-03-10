import 'dart:convert';

import 'package:http/http.dart' as http;

Future<void> main() async {
  var res = await consumo();
  print(res.id);
  print(res.toJson());
}

Future<Api> consumo() async {
  var cliente = http.Client();
  try {
    var resposta = await cliente.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
    var decode = jsonDecode(resposta.body);
    var objeto = Api.fromJson(decode);
    return objeto;
  } catch (e) {
    throw Exception("ERRO! não foi possível comsumir está API");
  } finally {
    cliente.close();
  }
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
  final bool completed;

  Api({required this.userId, required this.id, required this.title, required this.completed});

  factory Api.fromJson(Map json) {
    return Api(userId: json['userId'], id: json['id'], title: json['title'], completed: json['completed']);
  }

  Map toJson() {
    return {'userId': userId, 'id': id, 'title': title, 'completed': completed};
  }
}
