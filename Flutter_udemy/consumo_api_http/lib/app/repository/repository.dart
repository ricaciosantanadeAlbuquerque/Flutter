import 'dart:convert';
import 'package:consumo_api_http/app/model/model_api.dart';
import 'package:http/http.dart' as http;

class Repository77{
  final String _url = 'https://jsonplaceholder.typicode.com/todos';
  final _cliente = http.Client();

  Future consumo() async {
    try {
      final resposta = await _cliente.get(Uri.parse(_url));
      final decode = jsonDecode(resposta.body) as List;
      List<Api77> lista = decode.map((map) => Api77.fromJson(map)).toList();
      return lista;
    } catch (e) {
      throw Exception('NÃO FOI POSSÍVEL CONSUMIR ESTÁ API');
    }
  }
}
