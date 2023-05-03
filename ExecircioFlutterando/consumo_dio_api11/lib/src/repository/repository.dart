import 'package:consumo_dio_api11/src/model/api_dio.dart';
import 'package:dio/dio.dart';

class Repository {
  final String url = 'https://jsonplaceholder.typicode.com/todos';
  final dio = Dio();

  Future<List<ApiDio88>> consumo() async {
    try {
      final resposta = await dio.get(url);
      final lista = resposta.data as List;
      final listaApi = lista.map((map) => ApiDio88.fromJson(map)).toList();
      return listaApi;
    } catch (e) {
      throw Exception('ERRO! consumo da API não foi possível');
    }
  }
}
