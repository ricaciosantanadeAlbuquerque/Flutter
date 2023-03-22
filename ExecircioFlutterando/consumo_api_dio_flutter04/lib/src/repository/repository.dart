import 'package:dio/dio.dart';

import '../model/Api.dart';

class Repository {
  Dio dio = Dio();
  final url = 'https://jsonplaceholder.typicode.com/todos';

  Future<List<Api>> consumo() async {
    final resposta = await dio.get(url);
    final lista = resposta.data as List;
    List<Api> listApi = [];

    for (var json in lista) {
      final ob = Api.fromJson(json);
      listApi.add(ob);
    }
    return listApi;
  }
}
