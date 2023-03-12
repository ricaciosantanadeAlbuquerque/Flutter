class Api {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Api({required this.userId, required this.id, required this.title, required this.completed});

  factory Api.fromJson(Map json) {
    return Api(userId: json['userId'], id: json['id'], title: json['title'], completed: json['completed']);
  }

  @override
  String toString() => 'userId: $userId, id: $id, title: $title, completed: $completed';
}
