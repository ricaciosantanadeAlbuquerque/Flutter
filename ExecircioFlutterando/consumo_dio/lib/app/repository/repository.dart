import 'package:consumo_dio/app/model/api.dart';
import 'package:dio/dio.dart';

class Repository {

  final Dio dio = Dio(); // linha de instanciamento do dio;
  final String url = 'https://jsonplaceholder.typicode.com/todos'; // api

  Future<List<Api>> consumo() async {
    try {
      final resposta = await dio.get(url);
      final listaJson = resposta.data as List;
      List<Api> listaApi = listaJson.map((mapa) => Api.fomJson(json: mapa)).toList();
      return listaApi;
    } catch (e) {
      throw Exception('ERRO! não foi possível consumir esta API');
    }
  }
}
