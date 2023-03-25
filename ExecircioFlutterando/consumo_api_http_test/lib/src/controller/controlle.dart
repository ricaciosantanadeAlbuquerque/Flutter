import 'package:consumo_api_http_test/src/repository/repository.dart';

import '../model/Api.dart';

class Controle {
  List<Api> lista = [];
  Repository repository = Repository();
  Estado estado = Estado.inicio;

  Future inicio() async {
    estado = Estado.carregando;
    try {
      lista = await repository.consumo();
      estado = Estado.sucesso;
    } catch (e) {
      estado = Estado.erro;
    }
  }
}

enum Estado { inicio, carregando, sucesso, erro }
