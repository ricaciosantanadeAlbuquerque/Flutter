import 'package:converso_moeda08/app/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final entrada = TextEditingController();
  final saida = TextEditingController();
  final controle = HomeControlle(entrada: entrada, saida: saida);

  test('converte de dolar para real', () {
    entrada.text = '1';
    controle.convert();
    expect(saida.text, '0.20');
  });
}
