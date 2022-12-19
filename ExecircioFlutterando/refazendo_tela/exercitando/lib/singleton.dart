import 'package:flutter/cupertino.dart';

class Singleton extends ChangeNotifier {
  static Singleton instancia = Singleton();
  bool logico = false;
  void mudar() {
    logico = !logico;
    notifyListeners();
  }
}
