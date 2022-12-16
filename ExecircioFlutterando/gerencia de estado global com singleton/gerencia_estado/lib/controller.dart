import 'package:flutter/cupertino.dart';

class Controle extends ChangeNotifier {
  static Controle instancia =  Controle();
  bool mudar = false; // atribulto logico 
  void mudanca() {
    mudar = !mudar;
    notifyListeners();
  }
  /**
   * para ser o padrão singlento,  esta classe deve ser capaz de oferecer uma única isntância  e um ponto de acesso global
   */
}
