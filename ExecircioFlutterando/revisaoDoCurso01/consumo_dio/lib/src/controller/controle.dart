import 'package:consumo_dio/src/repository/repository.dart';
import 'package:flutter/material.dart';

import '../model/Api.dart';

class Controle {
  ValueNotifier<List<Api>> lista = ValueNotifier([]);
 final estado = ValueNotifier<EstadoTipo>(EstadoTipo.inicio);
  Repository repository = Repository();

  Future start() async {
    estado.value = EstadoTipo.carregando;
    try {
      lista.value = await repository.cosumo();
      estado.value = EstadoTipo.sucesso;
    } catch (e) {
      estado.value = EstadoTipo.erro;
    }
  }
}

enum EstadoTipo { inicio, carregando, sucesso, erro }
