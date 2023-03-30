import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/api.dart';

class Repository {
  
  final dio = Dio(); // constante que recebe um objeto Dio()
  final url = 'https://jsonplaceholder.typicode.com/todos';

  Future<List<Api>> consumo() async {
    try {
      var resposta = await dio.get(url);
      var listaJson = resposta.data as List;
      List<Api> lista = listaJson.map((json) => Api.fromJson(json: json)).toList();
      return lista;
      /**
       * A função map(json) vai mapear  listaJson, jogar cada elemento da lista para o construtor factory, que por sua vez vai criar um * objeto api() e retorna uma lista de objetos api. 
       * 
       */
    } catch (e) {
      throw Exception("NÃO FOI POSSÍVEL CONSUMIR ESTA API");
    }
  }
}
