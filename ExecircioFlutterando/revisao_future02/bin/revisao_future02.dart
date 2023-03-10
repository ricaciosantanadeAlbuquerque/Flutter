
void main() { // fluxo principal
  print4();
  print(" 1 ");
  print(" 2 ");
  print(" 3 ");
}

Future<void> print4() async {// fluxo assíncrona  01

  await Future.delayed(Duration(seconds: 2)); // fluxo assíncrona  02
  print(" 4 ");
}
