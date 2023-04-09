import 'package:flutter/material.dart';

class Controle extends ChangeNotifier {
  static Controle instancia = Controle();
  bool mudar = false;
  void mudando() {
    mudar = !mudar;
    notifyListeners();
  }
}
