void main() {
  print(stringToint("d"));
}

int stringToint(String texto) {
  var valor = 0;

  try {
    valor = int.parse(texto);
  } catch (e) {
    throw Exception("O texto passado ($texto) não é um número"); // execeção tratada
  }

  return valor;
}
