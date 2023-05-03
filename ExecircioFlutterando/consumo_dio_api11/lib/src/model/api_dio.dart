class ApiDio88 {
  final int _userId;
  final int _id;
  final String _title;
  final bool _completed;

  const ApiDio88(this._userId, this._id, this._title, this._completed);

  factory ApiDio88.fromJson(Map map) {
    return ApiDio88(map['userId'], map['id'], map['title'], map['completed']);
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': _userId,
      'id': _id,
      'title': _title,
      'completed': _completed,
    };
  }

  @override
  String toString() => 'id:$_id';

  bool get completed {
    return _completed;
  }

 
}


/**
 * {
  "userId": 1,
  "id": 1,
  "title": "delectus aut autem",
  "completed": false
}
 */