// Transformando função em  async
void main() {
  print4();
  print(" 1 ");
  print(" 2 ");
  print(" 3 ");
}

Future<void> print4() async {
   await Future.delayed(Duration(seconds: 2));
  print(4);
}
