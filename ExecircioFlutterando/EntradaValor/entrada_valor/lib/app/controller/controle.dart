import 'package:entrada_valor/main.dart';
import 'package:flutter/cupertino.dart';

import '../model/pessoa.dart';

class Controle {
  TextEditingController entrada;
  TextEditingController saida;
  Pessoa123? dados1;

  Controle(this.entrada, this.saida);

  void saidaDados() {
    dados1 = Pessoa123(entrada.text);
    saida.text = dados1!.getNome;
  }
}
