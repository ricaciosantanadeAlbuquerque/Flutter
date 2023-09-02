import 'package:flutter/cupertino.dart';

class Controle extends ChangeNotifier{
  static Controle instancia = Controle(); // padrão  Singleton
  bool verdade = false;

  void troca(){
    
    verdade = !verdade;
    notifyListeners();
  }
}