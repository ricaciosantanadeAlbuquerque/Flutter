import 'package:cosumo_api_dio_flutter04/src/repository/mapa.dart';

import '../model/api.dart';

class Controle {
  List<Api> lista = [];
  final repository = Repository();
  Estado estado = Estado.start;

  Future inicio() async {
    estado = Estado.loading;
    try {
      
      lista = await repository.consumo();
      estado = Estado.success;
    } catch (e) {
      estado = Estado.error;
    }
  }
}

enum Estado { start, loading, success, error }
