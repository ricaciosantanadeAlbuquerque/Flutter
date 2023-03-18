import 'package:consumo_api_flutter09/src/repository/repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final objeto = new Repository();
  test('restornar uma lista de objetos consumo', () async {
    final lista = await objeto.consumo();
    expect(lista[1].id, 2);
  });
}
