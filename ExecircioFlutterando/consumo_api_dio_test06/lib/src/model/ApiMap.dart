class APiMap {

  final int userId;
  final int id;
  final String title;
  final bool completed;

  APiMap({required this.userId, required this.id, required this.title, required this.completed});

  factory APiMap.fromJson({required Map json}) {
    return APiMap(userId: json['userId'], id: json['id'], title: json['title'], completed: json['completed']);
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'completed': completed,
    };
  }
  
  @override
  String toString() => 'id: $id';
}

/**
 * {
    "userId": 1,
    "id": 1,
    "title": "delectus aut autem",
    "completed": false
  },
 */