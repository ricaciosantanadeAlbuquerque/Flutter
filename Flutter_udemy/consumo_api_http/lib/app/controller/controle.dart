import 'package:consumo_api_http/app/model/model_api.dart';
import 'package:consumo_api_http/app/repository/repository.dart';
import 'package:flutter/material.dart';

class Controle77 {

  ValueNotifier<List<Api77>> lista = ValueNotifier([]);
  ValueNotifier<Estado> estado = ValueNotifier(Estado.inicio);
  Repository77 repository = Repository77();

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
