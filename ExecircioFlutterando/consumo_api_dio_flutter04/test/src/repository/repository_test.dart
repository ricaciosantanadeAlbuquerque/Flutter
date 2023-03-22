import 'package:consumo_api_dio_flutter04/src/repository/repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Repository repo = Repository();

  test('Trazer uma lista de objetos', () async {
    var lista = await repo.consumo();
    print(lista.toString());
    expect(lista[0].id, 1);
  });
}
