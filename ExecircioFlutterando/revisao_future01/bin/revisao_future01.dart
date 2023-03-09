void main(List<String> args) {

  var future = Future.delayed(Duration(seconds: 2));  // fluxo paralelo  assíncrona
  future.then((valeu) {
    print(" 4 ");
  });

  print(" 1 "); // fluxo  principal 
  print(" 2 ");
  print(" 3 ");
}
