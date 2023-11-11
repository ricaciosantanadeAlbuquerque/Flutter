import 'package:converso_moeda6/app/controller/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final entrada = TextEditingController();
  final saida = TextEditingController();
  final homeController = HomeController(entrada: entrada, saida: saida);
  test('converte de real par dolar', () {
    entrada.text = '1';
    homeController.convert();
    expect(saida.text, '0.20');
  });
}
