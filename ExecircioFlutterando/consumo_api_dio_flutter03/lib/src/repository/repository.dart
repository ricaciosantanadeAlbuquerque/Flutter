import 'package:consumo_api_dio_flutter03/src/model/mapa.dart';
import 'package:dio/dio.dart';

class Repository {

  final dio = Dio();


  Future<List<Mapear>> consumo() async {
    try {
      final resposta = await dio.get('https://jsonplaceholder.typicode.com/todos');
      final list = resposta.data as List;
      List<Mapear> ListaMapa = [];
      for (var p in list) {
        final j = Mapear.fromJson(p);

        ListaMapa.add(j);
      }
      return ListaMapa;
    } catch (e) {
      throw Exception("ERRO! Não foi possível consumir esta API !");
    } finally {
      dio.close();
    }
  }
  
}
