import 'package:consumo_api_dio_test06/src/controller/controle.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Controle controle = Controle();

  test('retorna uma lista ', () async {
    await controle.inicio();
    expect(controle.lista.isNotEmpty, true);
    print(controle.lista[0].id.toString());
  });

  test('verificando o estado ', () async {
    expect(controle.estado, Estado.inicio);
    await controle.inicio();
    expect(controle.estado, Estado.sucesso);
  });
}
