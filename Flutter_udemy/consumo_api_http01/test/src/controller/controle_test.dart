import 'package:consumo_api_http01/src/controller/controle.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Controle controle = Controle();

  test('verificando se a lista de preenchida', () async {
    await controle.iniciar();

    expect(controle.lista.value.isNotEmpty, true);
  });

  test('Testando o estado ', () async {
    expect(controle.estado.value, Estado.inicio);
    await controle.iniciar();
    expect(controle.estado.value, Estado.sucesso);
  });
}
