import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> main() async {
  var resposta = await consumo();
  print(resposta.titel);
}

Future<Api> consumo() async {
  // fluxo assícrona 01
  var cliente = http.Client();
  var resposta = await cliente.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
  var decodeFica = jsonDecode(resposta.body);
  Api objeto = Api(userId: decodeFica["userId"], id: decodeFica["id"], titel: decodeFica["title"], completed: decodeFica["completed"]);
  return objeto;
}

/**
 *  "userId": 1,
  "id": 1,
  "title": "delectus aut autem",
  "completed": false
 */

class Api {
  final int userId;
  final int id;
  final String titel;
  final bool completed;

  Api({required this.userId, required this.id, required this.titel, required this.completed});
}
