import 'package:consumo_api_flutter10/src/repository/api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Api api = Api();

  test('Trazer uma lista do tipo Mapa ', () async {
    var lista = await api.consumo();
    //print(lista);
    expect(lista[0].id, 1);
  });
}
