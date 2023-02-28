  class Api {

  final int? idUsuario;
  final int? id;
  final String? titulo;
  final bool? complemento;

  Api({required this.idUsuario, required this.id, required this.titulo, required this.complemento});

  factory Api.fromJson({required Map json}) {
    // recebe um mapa transforma para objeto e restorna os objetos 
    return Api(idUsuario: json["userId"], id: json["id"], titulo: json["title"], complemento: json['completed']);
  }
  @override
  String toString() {
    return 'Id Usuário $idUsuario,  Id: $id, Titulo: $titulo, Complemento: $complemento';
  }
}

/**
 * {
  "userId": 1,
  "id": 1,
  "title": "delectus aut autem",
  "completed": false
}
 */