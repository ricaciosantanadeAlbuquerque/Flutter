class Api {
   int userId;
   int id;
   String title;
   bool completed;

  Api({required this.userId, required this.id, required this.title, required this.completed});

  factory Api.fromJson({required Map json}) {
    return Api(userId: json['userId'], id: json['id'], title: json['title'], completed: json['completed']);
  }

  Map toJson() {
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