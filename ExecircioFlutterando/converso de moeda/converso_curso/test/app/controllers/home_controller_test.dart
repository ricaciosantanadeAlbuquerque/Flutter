import 'package:converso_curso/app/controle/home_controller.dart';
import 'package:converso_curso/app/model/moeda_modelo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final TextEditingController entrada = new TextEditingController();
  final TextEditingController saida = new TextEditingController();

  Controle controle = new Controle(entrada: entrada, saida: saida);

  test("deve converte de ral para double", () {
    entrada.text = '2.0';
    Controle controle = Controle(entrada: entrada, saida: saida);
    controle.converte();
    expect(saida.text, '0.36');
  });
  // com virgula
   test("deve converte de ral para double", () {
    entrada.text = '2,0';
    Controle controle = Controle(entrada: entrada, saida: saida);
    controle.converte();
    expect(saida.text, '0.36');
  });

  test(" deve converte de dolar para real ", () {
    entrada.text = "1.0";
    controle.deMoeda = MoedaModelo(nome: "Dolar", real: 5.65, dolar: 1.0, euro: 0.85, bitcoin: 0.000088);
    controle.paraMoeda = MoedaModelo(nome: "Real", real: 1.0, dolar: 0.18, euro: 0.15, bitcoin: 0.000016);
    controle.converte();
    expect(saida.text, '5.65');
  });
}
