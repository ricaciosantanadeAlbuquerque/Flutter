import 'package:consumo_http/src/controller/controle.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Controle controle = Controle();

  test('Carregando a lista ', () async {
    await controle.start();
    expect(controle.lista.value.isNotEmpty, true);
  });

  test('Testando estados ', () async {
    expect(controle.estado.value, GerenciaEstado.inicio);
    await controle.start();
    expect(controle.estado.value, GerenciaEstado.sucesso);
  });
}
