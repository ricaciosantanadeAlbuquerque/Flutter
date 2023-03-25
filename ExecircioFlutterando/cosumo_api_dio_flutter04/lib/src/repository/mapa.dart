import 'package:dio/dio.dart';

import '../model/api.dart';

class Repository {
  final dio = Dio();
  final url = 'https://jsonplaceholder.typicode.com/todos' ;

  Future<List<Api>> consumo() async {
    try {
      final resposta = await dio.get(url);
      var lista = resposta.data as List;
      List<Api> listaApi = lista.map((json) => Api.fromJson(json)).toList();
      return listaApi;
        } finally {
      dio.close();
    }

    
  }
  
}
