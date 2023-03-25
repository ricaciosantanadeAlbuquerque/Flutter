import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/Api.dart';

class Repository {
  final cliente = http.Client();
  final url = 'https://jsonplaceholder.typicode.com/todos';

  Future<List<Api>> consumo() async {
    try {
      var resosta = await cliente.get(Uri.parse(url));
      var listaJson =  jsonDecode( resosta.body) as List;
      List<Api> lista = listaJson.map((json) => Api.fomJson(json: json)).toList();
      return lista;
    } finally {
      cliente.close();
    }
  }
}