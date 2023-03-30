import 'package:flutter/cupertino.dart';

import '../model/api.dart';
import '../repository/repository.dart';

class Controle {
  
  List<Api> lista = [];
  Repository repository = Repository();
  final estado = ValueNotifier<Estado>(Estado.inicio);
// o ValueNotifier traz reatividade para o código, de maneira que o que ocorre nesta classe pode ser escutada por outra classe.
// AnimatedBuilder ou ValueListenableBuilder
  Future iniciar() async {
    estado.value = Estado.carregando;
    try {
      lista = await repository.consumo();
      estado.value = Estado.sucesso;
    } catch (e) {
      estado.value = Estado.erro;
    }
  }
}

enum Estado { inicio, carregando, sucesso, erro }
