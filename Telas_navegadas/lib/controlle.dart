import 'package:flutter/cupertino.dart';

class Controle extends ChangeNotifier {
  static Controle instancia = Controle();
  bool troca = false;
  void trocarValor() {
    troca = !troca; // treu
    notifyListeners();
  }
}
