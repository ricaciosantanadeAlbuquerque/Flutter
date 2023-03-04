void main() {
  var j = Future.delayed(Duration(seconds: 2));
  j.then((value) => print(4));
  print(1);
  print(2);
  print(3);
}
