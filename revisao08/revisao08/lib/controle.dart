import 'package:flutter/cupertino.dart';

class Controle extends ChangeNotifier{

 static Controle instancia = new Controle();

  bool verdade = false;
  
  void trocaLogica(){
    verdade = !verdade;
    notifyListeners();
  }

}