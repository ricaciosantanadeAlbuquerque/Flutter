import 'dart:convert';

import 'package:http/http.dart' as http;

Future<void> main() async {
  var cliente = http.Client();
  var resposta = await cliente.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
  var decodificaResposta = jsonDecode(resposta.body);
  print(decodificaResposta);
}
