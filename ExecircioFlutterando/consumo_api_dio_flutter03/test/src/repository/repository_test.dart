import 'package:consumo_api_dio_flutter03/src/repository/repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final repository = Repository();
  test('Trazer uma lista de objetos ', () async {
    final lista = await repository.consumo();
    print(lista.toString());
    expect(lista[0].id, 1);
  });
}
