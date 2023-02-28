void main(List<String> arguments) {
  consumo();
  print(" 1 ");
  print(" 2 ");
  print(" 3 ");
}

Future<void> consumo() async {
  // construtor nomeado da class Future
  await Future.delayed(Duration(seconds: 2)); // await == espere
  print(" 4 ");
}
/**
 * A programação assíncrona no dart é representada pelas Future
 */