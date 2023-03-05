import 'dart:convert';

import 'package:http/http.dart' as http;

Future<void> main() async {
  var resposta = await consumo();
  print(resposta.toString());
  print(resposta.toJson());
}

Future<ObjetoApi> consumo() async {
  var cliente = http.Client();

  try {
    var resposta = await cliente.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
    var decodificacao = jsonDecode(resposta.body);
    ObjetoApi objeto = ObjetoApi.fromJson(decodificacao);
    return objeto;
  } catch (e) {
    throw Exception('ERRO! não foi possível consumir esta API');
  } finally {
    cliente.close();
  }
}

// criando uma classe para mapear json para objeto

class ObjetoApi {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  ObjetoApi({required this.userId, required this.id, required this.title, required this.completed});

  factory ObjetoApi.fromJson(Map json) {
    return ObjetoApi(userId: json['userId'], id: json['id'], title: json['title'], completed: json['completed']);
  }

  Map toJson() {
    return {'userId': userId, 'id': id, 'title': title, 'completed': completed};
  }

  @override
  String toString() => 'Id:$userId, Id: $id, Title:$title, Completed:$completed';
}
