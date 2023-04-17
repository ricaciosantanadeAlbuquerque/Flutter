import 'package:consumo_dio/src/model/Api.dart';
import 'package:consumo_dio/src/repository/repository.dart';
import 'package:flutter/material.dart';

class Controle {
  ValueNotifier<List<ApiJson>> lista = ValueNotifier([]);
 final estado = ValueNotifier<EstadoJJ>(EstadoJJ.inicio);
  Repository repository = Repository();

  Future start() async {
    estado.value = EstadoJJ.carregando;
    try {
      lista.value = await repository.consumo();
      estado.value = EstadoJJ.sucesso;
    } catch (e) {
      estado.value = EstadoJJ.erro;
    }
  }
}

enum EstadoJJ { inicio, carregando, sucesso, erro }
