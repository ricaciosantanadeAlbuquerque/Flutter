import 'dart:convert';

import 'package:consumo_http/src/model/Api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Repository {
  final cliente = http.Client();
  final url = 'https://jsonplaceholder.typicode.com/todos';

  Future<List<Api>> consumo() async {
    try {
      final resposta = await cliente.get(Uri.parse(url));
      final decodeResposta = jsonDecode(resposta.body) as List;
      final listaApi = decodeResposta.map((element) => Api.fromJson(json: element)).toList();
      return listaApi;
    } catch (e) {
      throw Exception('ERRO! não foi possível comsumir está API');
    }
  }
}
