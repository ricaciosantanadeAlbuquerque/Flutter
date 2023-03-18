class Mapa {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Mapa({required this.userId, required this.id, required this.title, required this.completed});

  factory Mapa.fromJson(Map<String, dynamic> json) {
    return Mapa(userId: json['userId'], id: json['id'], title: json['title'], completed: json['completed']);
  }

  Map toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['completed'] = this.completed;

    return data;
  }
  @override
  String toString() {
    return 'id: $id userId: $userId, title: $title completed:$completed';
  }
}

/**
 *  {
    "userId": 1,
    "id": 1,
    "title": "delectus aut autem",
    "completed": false
  },
  {
 */