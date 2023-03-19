class Mapa {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Mapa({required this.userId, required this.id, required this.title, required this.completed});

  factory Mapa.formJson(Map json) {
    return Mapa(userId: json['userId'], id: json['id'], title: json['title'], completed: json['completed']);
  }

  Map toJson() {
    return {'userId': userId, 'id': id, 'title': title, 'completd': completed};
  }
  @override
  String toString() => 'id:$id';
}

/**
 * 
    "userId": 1,
    "id": 1,
    "title": "delectus aut autem",
    "completed": false
 */