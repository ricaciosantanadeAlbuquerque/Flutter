import 'dart:convert';

import 'package:future05/future05.dart' as future05;
import 'package:http/http.dart' as http;

void main(List<String> arguments) async {
  api();
  //consumo();
}

Future api() async {
  var cliente = http.Client();
  var response = await cliente.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
  var decodeResponse = jsonDecode(response.body);
  print(decodeResponse);
  cliente.close();
}

Future consumo() async {
  var x = http.Client();
  var respotas = await x.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
  var decodificarResposta = jsonDecode(respotas.body);
  print(decodificarResposta);
  x.close();
}

Future consumo1() async {
  var cliente = http.Client();
  var response = await cliente.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
  var decodeRes = jsonDecode(response.body);
  print(decodeRes);
  cliente.close();
}

Future consumo2() async {
  var j = http.Client();
  var respotas = await j.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
  var decoRespota = jsonDecode(respotas.body);
  print(decoRespota);
  j.close();
}

Future consumo3() async {
  var c = http.Client();
  var r = await c.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
}
