
class Mapear {

  final int userId;
  final int id;
  final String title;
  final bool completed;

  Mapear({required this.userId, required this.id, required this.title, required this.completed});

  factory Mapear.fromJson(Map json) {
    return Mapear(userId: json['userId'], id: json['id'], title: json['title'], completed: json['completed']);
  }

  Map<String, dynamic> toJson() {
    return {'userId': userId, 'id': id, 'title': title, 'completed': completed};
  }
   @override
  String toString() => ' id: $id';
}
