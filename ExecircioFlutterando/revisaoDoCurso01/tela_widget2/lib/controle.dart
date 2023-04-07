import 'package:flutter/material.dart';

class Controle extends ChangeNotifier {
  static Controle controle = Controle();
  bool verdade = false;
  void mudar() {
    verdade = !verdade;
    notifyListeners();
  }
}
