class ApiJson {

  final int userId;
  final int id;
  final String title;
  final bool completed;

  ApiJson({required this.userId, required this.id, required this.title, required this.completed});

  factory ApiJson.fromJson({required Map json}) {
    return ApiJson(userId: json['userId'], id: json['id'], title: json['title'], completed: json['completed']);
  }

  Map<String, dynamic> toMap() {
    return {'userId': userId, 'id': id, 'title': title, 'completed': completed};
  }

  @override
  String toString() {
    return 'userId: ${this.userId}\n, id: ${this.id}\n, title:${this.title}\n, completed ${this.completed}\n';
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