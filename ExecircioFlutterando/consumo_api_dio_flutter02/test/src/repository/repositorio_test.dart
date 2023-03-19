import 'package:consumo_api_dio_flutter02/src/repository/repositorio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Repositorio p = Repositorio();
  test('Trazendo uma lista de objetos Mapa', () async {
    var lista = await p.consumo();
    print(lista.toString());
    expect(lista[0].id, 1);
  });
}
