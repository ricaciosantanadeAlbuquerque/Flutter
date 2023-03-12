class ObjetoApi {

  final int userId;
  final int id;
  final String title;
  final bool completed;

  ObjetoApi({required this.userId, required this.id, required this.title, required this.completed});

  factory ObjetoApi.fromJson(Map json) {
    return ObjetoApi(userId: json['userId'], id: json['id'], title: json['title'], completed: json['completed']);
  }
  @override
  String toString() => 'userId: $userId, id: $id, title: $title, completed: $completed';
}

/**
 * {
    "userId": 1,
    "id": 1,
    "title": "delectus aut autem",
    "completed": false
  },
 */