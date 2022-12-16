import 'package:flutter/cupertino.dart';

class Controle extends ChangeNotifier{
 static Controle instancia = Controle();
 bool logica = false;
 void trocar(){
  logica = !logica;
  notifyListeners();
 }
}