import 'package:flutter/material.dart';

class Controle extends ChangeNotifier {
  static final Controle _instancia = Controle._jjnstancia();
  bool valor = false;

  Controle._jjnstancia();

   static Controle get instancia {
    return _instancia;
  }

  void mudar() {
    valor = !valor;
    notifyListeners();
  }
}
