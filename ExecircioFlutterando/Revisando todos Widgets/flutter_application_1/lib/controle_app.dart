import 'package:flutter/cupertino.dart';

class Controle extends ChangeNotifier {
  // necessário o padrão singleton
  bool valor = false;
  static Controle instancia = new Controle(); // instância de classe
  void mudarValor() {
    valor = !valor;
    notifyListeners();
  }
}
