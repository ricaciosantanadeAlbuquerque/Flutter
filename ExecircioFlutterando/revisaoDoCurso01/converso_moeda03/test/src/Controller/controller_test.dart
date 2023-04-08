import 'package:converso_moeda03/src/controller/controle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TextEditingController entrada = TextEditingController();
  TextEditingController saida = TextEditingController();

  Controle controle = Controle(entrada: entrada, saida: saida);
  test('converso', () {
    entrada.text = '1';
    controle.converte();
    expect(saida.text, '0.20');
  });
}
