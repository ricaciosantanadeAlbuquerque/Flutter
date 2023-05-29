class ApiMap {
  
  final int userId;
  final int id;
  final String title;
  final bool completed;

  ApiMap({required this.userId, required this.id, required this.title, required this.completed});

  factory ApiMap.fromJson(Map<String, dynamic> json) {
    return ApiMap(userId: json['userId'], id: json['id'], title: json['title'], completed: json['completed']);
  }

  Map<String, dynamic> toMap() {
    return {'userId': userId, 'id': id, 'title': title, 'completed': completed};
  }

  @override
  String toString() => 'id:$id';
}

/**
 * {
  "userId": 1,
  "id": 1,
  "title": "delectus aut autem",
  "completed": false
}
 */