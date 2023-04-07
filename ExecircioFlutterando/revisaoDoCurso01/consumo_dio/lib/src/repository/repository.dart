import 'package:consumo_dio/src/model/Api.dart';
import 'package:dio/dio.dart';

class Repository {
  final Dio dio = Dio();
  final String url = 'https://jsonplaceholder.typicode.com/todos';

  Future<List<Api>> cosumo() async {
    try {
      final resposta = await dio.get(url);
      final lista = resposta.data as List; // as List significa que estamos tipado o retorno como uma lista 'List<dynamic>'
      final listaApi = lista.map((json) => Api.fromJson(json: json)).toList();
      return listaApi;
    } catch (e) {
      throw Exception('ERRO! NÃO FOI POSSÍVEL COMSUMIR ESTA API');
    }
  }
}
