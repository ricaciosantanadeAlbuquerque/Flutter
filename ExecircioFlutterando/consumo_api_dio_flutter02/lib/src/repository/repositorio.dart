import 'package:dio/dio.dart';

import '../model/Mapa.dart';

class Repositorio {
  
  Dio dio = Dio();

  Future<List<Mapa>> consumo() async {
    try {
      Response resposta = await dio.get('https://jsonplaceholder.typicode.com/todos');
      var lista = resposta.data as List;

      List<Mapa> arrayMapa = [];

      for (var json in lista) {
        final m = Mapa.formJson(json);
        arrayMapa.add(m); 
      }
      return arrayMapa;
    } catch (exe) {
      throw Exception(" Não foi possível consumir está API ");
    } finally {
      dio.close();
    }
  }
}
