import 'package:dio/dio.dart';

import '../model/Mapa.dart';

class Api {
  Dio api = new Dio(); // instância da classe Dio()
  final URL = 'https://jsonplaceholder.typicode.com/todos'; // lista json

  Future<List<Mapa>> consumo() async {
    try {
      var resposta = await api.get(URL);
      var lista = resposta.data as List; // lista de objetos json{}
      List<Mapa> listaMapa = [];

      for (var p in lista) { // Mapeando
       
        final j = Mapa.fromJson(p);  // j é um objeto da classe Mapa com os valores do json da posicao 0 de lita.

        listaMapa.add(j);
      }
      return listaMapa;
    } catch (e) {
      throw Exception("ERRO! não foi possível consumir esta API");
    } finally {
      api.close();
    }
  }
  
}
