import 'package:consumo_api_http/app/model/model_api.dart';
import 'package:consumo_api_http/app/repository/repository.dart';
import 'package:flutter/material.dart';

class Controle {
  
  ValueNotifier<List<Api77>> lista = ValueNotifier([]);
  ValueNotifier<Estado> estado = ValueNotifier(Estado.inicio);
  Repository repository = Repository();

  Future<void> start() async {
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
