import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test/test.dart';

import 'objetoAPI.dart';

void main() {
  consumo();
}

consumo() async {
  var cliente = http.Client(); // criamos um objeto cliente

  try {
    var resposta = await cliente.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
    var decoficarResposta = jsonDecode(resposta.body);
    print(decoficarResposta.runtimeType); // Sabemos que o retorno é um objeto
    print(decoficarResposta is Null);
    var resultado = Api.fromJson(json: decoficarResposta);
    print(resultado.toString());
  } finally {
    cliente.close();
  }
}
