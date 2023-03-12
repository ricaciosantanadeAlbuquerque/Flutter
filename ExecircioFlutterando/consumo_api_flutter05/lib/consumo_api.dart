class ApiConsumo {

  final int userId;
  final int id;
  final String title;
  final bool completed;

  ApiConsumo({required this.userId, required this.id, required this.title, required this.completed});

  factory ApiConsumo.fromJson(Map json){
    return ApiConsumo(userId: json['userId'], id: json['id'], title: json['title'], completed: json['completed']);
  }
  
  @override
  String toString(){
    return " UserId: $userId id: $id, title: $title, completed: $completed";
  }
}
/**
   *  {
    "userId": 1,
    "id": 1,
    "title": "delectus aut autem",
    "completed": false
  },
   */