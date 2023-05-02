class Api77 {

  final int userId;
  final int id;
  final String title;
  final bool completed;

  const Api77({required this.userId, required this.id, required this.title, required this.completed});

  factory Api77.fromJson(Map<String, dynamic> json) {
    return Api77(userId: json['userId'], id: json['id'], title: json['title'], completed: json['completed']);
  }

  Map<String,dynamic> toMap() {
    return {
      'userId':userId,
      'id':id,
      'title':title,
      'comcpleted':completed
    };
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