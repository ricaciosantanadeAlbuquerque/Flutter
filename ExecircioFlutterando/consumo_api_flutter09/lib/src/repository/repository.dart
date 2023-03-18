import 'package:consumo_api_flutter09/src/model/Map_Api.dart';
import 'package:dio/dio.dart';

class Repository 
{
  final dio = new Dio();

  Future<List<Consumo>> consumo() async {
    final resposta = await dio.get('https://jsonplaceholder.typicode.com/todos');
    final lista = resposta.data as List;
    List<Consumo> listaConsumo = [];
    for (var json in lista) {
      final objeto = Consumo.fomJson(json);
      listaConsumo.add(objeto);
    }

    return listaConsumo;
  }
}
