import 'package:flutter/cupertino.dart';

import '../model/api_http.dart';
import '../repository/repository.dart';

class Controle {
  ValueNotifier<List<Api>> lista = ValueNotifier([]);
  Repository repository = Repository();
  ValueNotifier<bool> carregando = ValueNotifier(false); // sera usado como estado

  Future iniciar() async {
    carregando.value = true;
    Future.delayed(const Duration(seconds: 3));
    try {
      lista.value = await repository.consumo();
      carregando.value = false;
    } catch (e) {
      throw Exception("Falha ao carregar a lista ");
    }
  }
}
