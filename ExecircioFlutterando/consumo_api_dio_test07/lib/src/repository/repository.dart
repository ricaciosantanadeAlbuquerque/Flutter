import 'package:consumo_api_dio_test07/src/model/api.dart';
import 'package:dio/dio.dart';

class Repository {
  final dio = Dio();
  final url = 'https://jsonplaceholder.typicode.com/todos';

  Future<List<Api>> consumo() async {
    try {
      final resposta = await dio.get(url);
      final lista = resposta.data as List;
      final listaApi = lista.map((json) => Api.fromJson(json: json)).toList();
      return listaApi;
    } finally {
     // dio.close(); ERRO não era possível recarregar a chamada por estavamos fechando o  canal ou objeto que faz a consulta. 
  
    }
  }
}
