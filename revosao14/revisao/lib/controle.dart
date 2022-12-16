import 'package:flutter/cupertino.dart';

class Controle extends ChangeNotifier{

  static  Controle instancia =  new Controle();

    bool _verdade = false;

   void troca(){
    _verdade = !_verdade;
    notifyListeners();
   }

   get getVerdade{
      return  this._verdade;
   }

   set setVerdade(bool verdade){
     this._verdade = verdade;
   }

}