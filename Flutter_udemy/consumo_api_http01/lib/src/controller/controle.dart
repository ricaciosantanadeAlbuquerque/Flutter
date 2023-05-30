import 'package:consumo_api_http01/src/model/api_map.dart';
import 'package:consumo_api_http01/src/repository/repository.dart';
import 'package:flutter/material.dart';

class Controle {
  ValueNotifier<List<ApiMap>> lista = ValueNotifier([]);
  ValueNotifier<Estado> estado = ValueNotifier(Estado.inicio);
  Repository repository = Repository();

  Future<void> iniciar() async {
    estado.value = Estado.carregando;
    try {
      lista.value = await repository.consumo();
      estado.value = Estado.sucesso;
    } catch (e) {
      estado.value = Estado.carregando;
      await Future.delayed(const Duration(seconds: 2));
      estado.value = Estado.erro;
    }
  }
}

enum Estado { inicio, carregando, sucesso, erro }
