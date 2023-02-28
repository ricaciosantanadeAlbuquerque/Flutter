import 'dart:convert';

import 'package:http/http.dart' as http;

void main(List<String> arguments) {
  consumo();
  // var resposta = Mostrar().retornoInstancia(); nova instancia outro objeto
}

class Mostrar {
  Post? p;
  Mostrar({this.p});
  void retornoInstancia() {
    print(p.toString());
  }
}

Future consumo() async {
  var cliente = http.Client();

  try {
    var respotas = await cliente.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
    var decodiRespota = jsonDecode(respotas.body);
    //print(decodiRespota.runtimeType);
    Post.fromJson(decodiRespota); //chamada ao construtor factory
  } finally {
    cliente.close();
  }
}

class Post {
  final int? userId;
  final int? id;
  final String? title;
  final bool? completed;

  Post(this.userId, this.id, this.title, this.completed) {
    Mostrar p = Mostrar(p: this); // estou passando a instancia desta classe
    p.retornoInstancia();
  }

  Post.nulo({this.userId, this.id, this.title, this.completed});

  factory Post.fromJson(Map json) {
    return Post(json['userId'], json['id'], json['title'], json['completed']);
  }

  @override
  String toString() {
    return 'userId: $userId, id: $id, title: $title, completed: $completed';
  }
}
