import 'package:consumo_api_dio_test06/src/model/ApiMap.dart';
import 'package:dio/dio.dart';

class Repository {
  Dio dio = Dio();

  Future<List<APiMap>> consumo() async {
    try {
      final resposta = await dio.get('https://jsonplaceholder.typicode.com/todos');
      final listaJson = resposta.data as List;
      return listaJson.map((json) => APiMap.fromJson(json: json)).toList();
    } finally {
      dio.close();
    }
  }
}
