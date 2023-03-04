import 'dart:convert';

import 'package:http/http.dart' as http;

void main() async {
  final respostaApi = await consumo();
  print(respostaApi.toString()); // retorna os atribultos do objeto 'respostaApi'
  print(respostaApi.toJson()); // retorna um json
}

Future<ConsumoApi> consumo() async {
  var cliente = http.Client();
  var resposta = await cliente.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1')); // consulta api
  var decodificacao = jsonDecode(resposta.body);
  ConsumoApi objetoApi = ConsumoApi.fromJson(decodificacao);

  return objetoApi;
}

class ConsumoApi {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  ConsumoApi({required this.userId, required this.id, required this.title, required this.completed});

  factory ConsumoApi.fromJson(Map json) {
    return ConsumoApi(userId: json['userId'], id: json['id'], title: json['title'], completed: json['completed']);
  }

  Map toJson() {
    return {'id': id, 'userId': userId, 'title': title, 'completed': completed};
  }

  @override
  String toString() => 'Id: $id, UserId: $userId, Title: $title, Completed: $completed';
}
