import 'package:converso_moeda07/app/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final entrada = TextEditingController();
  final saida = TextEditingController();
  final controle = HomeController(entrada: entrada, saida: saida);

  test('converte de ral para dolar', () {
    entrada.text = '1';
    controle.convert();
    expect(saida.text, '0.20');
  });
}
