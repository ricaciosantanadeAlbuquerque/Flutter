class Consumo {
  
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Consumo({required this.userId, required this.id, required this.title, required this.completed});

  factory Consumo.fomJson(Map<String, dynamic> json) {
    return Consumo(userId: json['userId'], id: json['id'], title: json['title'], completed: json['completed']);
  }

  Map<String, dynamic> toJson() {
    return {
      'userId':userId,
      'id':id,
      'title':title,
      'completed':completed
    };
  }
}

/**
 * "userId": 1,
    "id": 1,
    "title": "delectus aut autem",
    "completed": false
 */