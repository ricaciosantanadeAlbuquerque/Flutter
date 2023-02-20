import 'package:converso05/app/models/moeda.dart';
import 'package:flutter/cupertino.dart';

class Controle {

  List<Moeda>? lista;
  Moeda? de;
  Moeda? para;
  TextEditingController entrada;
  TextEditingController saida;

  Controle(this.entrada, this.saida) {
    lista = Moeda.getMoeda();
    de = lista![0];
    para = lista![1];
  }
  
}
