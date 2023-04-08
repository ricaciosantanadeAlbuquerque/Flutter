import 'package:consumo_http/src/model/Api.dart';
import 'package:consumo_http/src/repository/repository.dart';
import 'package:flutter/material.dart';

class Controle {
  ValueNotifier<List<Api>> lista = ValueNotifier([]);
  ValueNotifier<GerenciaEstado> estado = ValueNotifier(GerenciaEstado.inicio); // reativo
  Repository repository = Repository();

  Future<void> start() async {
    estado.value = GerenciaEstado.carregado;
    try {
      lista.value = await repository.consumo();
      estado.value = GerenciaEstado.sucesso; //  preenche a lista 
    } catch (e) {
      estado.value = GerenciaEstado.erro;
    }
  }
}

enum GerenciaEstado { inicio, carregado, sucesso, erro }
