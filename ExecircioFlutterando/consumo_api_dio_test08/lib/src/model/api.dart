class Api {
  
  final int userId; // constantes em tempo de execução, não variam
  final int id;
  final String title;
  final bool completed;

  Api({required this.userId, required this.id, required this.title, required this.completed}); // construtor padrão com parâmetros nomeados.

// recebe  um Map e retorna um objeto Api()
  factory Api.fromJson({required Map json}) {
    return Api(userId: json['userId'], id: json['id'], title: json['title'], completed: json['completed']);
  }

// retorna um map criado com os valores dos atribultos desta classe
  Map tojson() {
    return {
      'userId':userId,
      'id':id,
      'title':title,
      'completed':completed
    };
  }

  @override  // polimorfismo de sobreposição obrigatória
  String toString() => 'id: $id';
}

/**
 * {
  "userId": 1,
  "id": 1,
  "title": "delectus aut autem",
  "completed": false
}
 */