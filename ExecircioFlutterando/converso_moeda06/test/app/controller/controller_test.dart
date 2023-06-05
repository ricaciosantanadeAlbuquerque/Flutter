import 'package:converso_moeda06/app/controller/controle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TextEditingController entrada = TextEditingController();
  TextEditingController saida = TextEditingController();
  final controle = Controle(entrada: entrada, saida: saida);

  test('deve converter de dolar para real', () {
    entrada.text = '1,0';
    controle.converter();
    expect(saida.text, '0.20');
  });
}
