import 'package:consumo_api_dio_test05/src/model/api_map.dart';
import 'package:dio/dio.dart';

class Repository {

  final dio = Dio();
  final url = 'https://jsonplaceholder.typicode.com/todos';

  Future<List<ApiMap>> consumo() async {

    try {
      final resposta = await dio.get(url);
      final listaJson = resposta.data as List;
      return listaJson.map((json) => ApiMap.formJson(json: json)).toList(); // retornamos ila Lista de ApiMap
    } finally {
      dio.close();
    }
  }
}


