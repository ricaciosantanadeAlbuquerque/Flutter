import 'package:cosumo_api_dio_flutter04/src/controller/controle.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Controle controle = Controle();

  test('checar se  a lista  é ou não vazia ', () async {
    expect(controle.estado, Estado.start);
    await controle.inicio();
    expect(controle.estado, Estado.success);
    for (var json in controle.lista) {
      print(json.id.toString());
    }
    expect(controle.lista.isNotEmpty, true);
    expect(controle.lista[0].id, 1);
  });
}
