import 'package:consumo_api_dio_test06/src/model/ApiMap.dart';
import 'package:consumo_api_dio_test06/src/repository/respository.dart';

class Controle {
  
  List<APiMap> lista = []; // atribulto que liga o controle  ao model  ApiMap()
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
