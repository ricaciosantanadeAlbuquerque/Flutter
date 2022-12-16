import 'package:flutter/cupertino.dart';

class Controle extends ChangeNotifier {
  static Controle instancia = Controle();
  bool verdade = false;
  void mundanca() {
    verdade = !verdade;
    notifyListeners();
  }
}
