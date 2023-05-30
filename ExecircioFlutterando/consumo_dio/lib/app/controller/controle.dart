import 'package:flutter/material.dart';
import '../model/api.dart';
import '../repository/repository.dart';

class Controle {
  ValueNotifier<List<Api>> lista = ValueNotifier([]);
  ValueNotifier<Estado> estado = ValueNotifier(Estado.inicio);
  Repository repository = Repository();

  Future<void> inicio() async {
    estado.value = Estado.carregando;
    try {
      lista.value = await repository.consumo();
      estado.value = Estado.sucesso;
    } catch (e) {
      estado.value = Estado.carregando;
      await Future.delayed(const Duration(seconds: 2));// construtor nomeado da classe Future
      estado.value = Estado.erro;
    }
  }
}

enum Estado { inicio, carregando, sucesso, erro }
