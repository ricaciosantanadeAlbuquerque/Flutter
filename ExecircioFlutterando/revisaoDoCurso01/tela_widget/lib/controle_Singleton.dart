import 'package:flutter/material.dart';

class Controle extends ChangeNotifier {
  static Controle controle = Controle();
  bool mudar = false;
  void mudando() {
    mudar = !mudar; // o NAO inverte os valores
    notifyListeners(); // notificar que houve mudança
  }
}
