import 'package:flutter/cupertino.dart';

class Controle extends ChangeNotifier {
  // padrão singleton
  static Controle instancia =  Controle();

  bool valor = false;
  void mudarValor() {
    valor = !valor;
    notifyListeners();
  }
}
