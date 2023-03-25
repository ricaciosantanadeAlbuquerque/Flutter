import 'package:consumo_api_dio_test05/src/model/api_map.dart';
import 'package:consumo_api_dio_test05/src/repository/repository.dart';

class Controle {
  List<ApiMap> lista = [];
  final repository = Repository();
  Estado estado = Estado.start;

  Future inicio() async {

     estado = Estado.loading;

    try {

      lista = await repository.consumo();

      estado = Estado.sucess;
    } catch (e) {
      estado = Estado.erro;
    };
    
  }
}

enum Estado { start, loading, sucess, erro }
