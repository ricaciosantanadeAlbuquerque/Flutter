import 'package:flutter/material.dart';

class Controle extends ChangeNotifier {
  bool valor = false;
  static final Controle instancia = Controle._exetucar();
  void mudar() {
    valor = !valor;
    notifyListeners();
  }

  Controle._exetucar();
}
