import 'package:dio/dio.dart';

import '../model/Api.dart';

class Consumo {

  Dio novoDio = Dio(); // novoDio é um objeto da class Dio()

  Future<List<Api>> consumo() async {
      try{
        var resposta = await novoDio.get('https://jsonplaceholder.typicode.com/todos'); // retorna uma lista de json [{}]
      var lista = resposta.data as List;

      List<Api> listaApi = [];

      for (var json in lista) {
        var objeto = Api.fromJson(json);
        listaApi.add(objeto);
      }
      return listaApi;
      }catch(e){
        throw Exception('ERRO! não foi possível consumir esta API ');
      }finally{
        novoDio.close();
      }
  }

 
}
