class Api {
  
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Api({required this.userId, required this.id, required this.title, required this.completed});

  factory Api.fomJson({ required Map<String, dynamic> json}) => Api(userId: json['userId'], id: json['id'], title: json['title'], completed: json['completed']);

  Map<String, dynamic> toJson() {
    return {'userId': userId, 'id': id, 'title': title, 'completed': completed};
  }

  @override
  String toString() => 'userId:$userId,\n id:$id,\n title:$title,\n';
}


/**
 * "userId": 1,
  "id": 1,
  "title": "delectus aut autem",
  "completed": false
 */