import 'package:consumo_dio/src/model/Api.dart';
import 'package:dio/dio.dart';

class Repository {
  final Dio dio = Dio();
  final String url = 'https://jsonplaceholder.typicode.com/todos';

  Future<List<ApiJson>> consumo() async {
   
    try {
      final resposta = await dio.get(url);
      final listaJson = resposta.data as List;
      final listaApi = listaJson.map((element) => ApiJson.fromJson(json: element)).toList();
      return listaApi;
    } catch (e) {
      throw Exception('Nao foi possível consumir esta API');
    }
  }
}
