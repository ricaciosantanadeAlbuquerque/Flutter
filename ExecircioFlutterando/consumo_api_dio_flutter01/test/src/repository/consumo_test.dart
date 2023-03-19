import 'package:consumo_api_dio_flutter01/src/repository/consumo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Consumo consumo = Consumo();
  test('Trazer uma lista de objetos Api ', () async {
    var lista = await consumo.consumo();
  
    expect(lista[0].id, 1);
  });
}
