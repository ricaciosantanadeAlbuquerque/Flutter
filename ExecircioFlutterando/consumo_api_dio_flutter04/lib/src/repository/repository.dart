import 'package:dio/dio.dart';

import '../model/Api.dart';

class Repository {
  Dio? dio;
  final url = 'https://jsonplaceholder.typicode.com/todos';

  Repository({ Dio? cliente}) {
    if (cliente == null) {
      dio = Dio(); // dio verdadeiro
    }else{
      dio = cliente; // se o parâmetro tiver uma instância, passe para o cliente.
    }
  }

  Future<List<Api>> consumo() async {
    List<Api> listApi = [];
    if(this.dio != null){
      final resposta = await dio!.get(url);
      final lista = resposta.data as List;

      for (var json in lista) {
        final ob = Api.fromJson(json);
        listApi.add(ob);
      }
       
    }
     return listApi;
  
  }
}
