import 'package:consumo_dio_api11/src/model/api_dio.dart';
import 'package:consumo_dio_api11/src/repository/repository.dart';
import 'package:flutter/material.dart';

class Controle {
  ValueNotifier<List<ApiDio88>> lista = ValueNotifier([]);
  ValueNotifier<Estado> estado = ValueNotifier(Estado.inicio);
  Repository repository = Repository();

  Future iniciar() async {
    estado.value = Estado.carregando;
    try {
      lista.value = await repository.consumo();
      estado.value = Estado.sucesso;
    } catch (e) {
      estado.value = Estado.erro;
    }
  }
}

enum Estado { inicio, carregando, sucesso, erro }
