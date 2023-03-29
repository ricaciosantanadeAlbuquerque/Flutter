import 'package:consumo_api_dio_test07/src/model/api.dart';
import 'package:consumo_api_dio_test07/src/repository/repository.dart';
import 'package:flutter/cupertino.dart';

class Controle {
  List<Api> lista = [];
  Repository repository = Repository();
  var estado = ValueNotifier<EstadoValue>(EstadoValue.inicio);

  Future iniciar() async {
    estado.value = EstadoValue.carregando;
    await Future.delayed(const Duration(seconds: 5));
    try {
      lista = await repository.consumo();
      estado.value = EstadoValue.sucesso;
    } catch (e) {
      estado.value = EstadoValue.erro;
    }
  }
}

enum EstadoValue { inicio, carregando, sucesso, erro }
