void main(List<String> arguments) {
  var future = Future.delayed(Duration(seconds: 2));
  future.then((value) => print('4'));
  print(" 1 ");
  print(" 2 ");
  print(" 3 ");
  
}
