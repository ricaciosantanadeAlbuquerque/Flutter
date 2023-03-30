import 'dart:convert';
import '../model/api_http.dart';
import 'package:http/http.dart' as http;

class Repository {
  
  final cliente = http.Client();
  final String url = 'https://jsonplaceholder.typicode.com/todos';

  Future<List<Api>> consumo() async {
    try {
      final resposta = await cliente.get(Uri.parse(url));
      final decodeLista = jsonDecode(resposta.body) as List;
      final lista = decodeLista.map((json) => Api.fromJson(json: json)).toList();
      return lista;
    } catch (e) {
      throw Exception("ERRO! não foi possível consumir está API ");
    }
  }
}
