class ApiMap{

final int userId;
final int id;
final String title;
final bool completed;

ApiMap({required this.userId,required this.id,required this.title,required this.completed});

factory ApiMap.formJson({required Map json}){
  return ApiMap(userId: json['userId'], id: json['id'], title: json['title'], completed: json['completed']);
}

 Map toJson(){
  return{
    'userId':userId,
    'id':id,
    'title':title,
    'completed':completed
  };
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