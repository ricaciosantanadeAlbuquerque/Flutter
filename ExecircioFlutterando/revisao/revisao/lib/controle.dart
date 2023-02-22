import 'package:flutter/cupertino.dart';

class Controle extends ChangeNotifier {
  bool logico = false;
  static Controle instancia = Controle();
  void mudar() {
    logico = !logico;
    notifyListeners();
  }
}
