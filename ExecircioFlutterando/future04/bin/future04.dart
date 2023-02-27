import 'dart:convert';

import 'package:http/http.dart' as http;

void main(List<String> arguments) async {
  var cliente = http.Client();
  var response = await cliente.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
  var decodeResponse = jsonDecode(response.body);
  print(decodeResponse);

  cliente.close();
}
