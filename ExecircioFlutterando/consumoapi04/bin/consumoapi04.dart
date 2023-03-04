import 'dart:convert';

import 'package:http/http.dart' as http;

void main() async {
  var resposta = await comsumo();
  print(resposta.id);
  print(resposta.toString());
  print(resposta.toJson());
}

Future<ObjetoApi> comsumo() async {
  var cliente = http.Client();
  var resposta = await cliente.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
  var decodificacao = jsonDecode(resposta.body);
  var objeto = ObjetoApi.fromJson(decodificacao);
  return objeto;
}

class ObjetoApi {
  final int userId;
  final int id;
  final String title;
  final bool completd;

  ObjetoApi({required this.userId, required this.id, required this.title, required this.completd});

  factory ObjetoApi.fromJson(Map json) {
    return ObjetoApi(userId: json['userId'], id: json['id'], title: json['title'], completd: json['completed']);
  }

  Map toJson() {
    // retorna Json
    return {'userId': userId, 'id': id, 'title': title, 'completed': completd};
  }

  String toString() => 'ID:$id, UserId: $userId, Title:$title, Completed:$completd';
}
