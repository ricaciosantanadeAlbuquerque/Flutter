import 'dart:convert';
import 'package:consumo_api_http01/src/model/api_map.dart';
import 'package:http/http.dart' as http;

class Repository {
  final cliente = http.Client(); // linha de instanciamento
  final String url = 'https://jsonplaceholder.typicode.com/todos';

  Future<List<ApiMap>> consumo() async {
    try {
      final resposta = await cliente.get(Uri.parse(url));
      final decodeResposta = jsonDecode(resposta.body) as List; // especificando a lista (as List)
      final List<ApiMap> lista = decodeResposta.map((map) => ApiMap.fromJson(map)).toList();
      return lista;
    } catch (e) {
      throw Exception('ERRO! valor Não foi possível consumir esta api ');
    }
  }
}
