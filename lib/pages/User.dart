import 'package:hive/hive.dart';
part 'user.g.dart';
@HiveType(typeId: 0)
class User extends HiveObject{
  @HiveField(0)
  late String id;
  @HiveField(1)
  String fullname;
  @HiveField(2)
  String username;
  @HiveField(3)
  String password;
  User({required this.id,required this.fullname, required this.username,required this.password});
}

class HiveBoxes{
  static String registers='registers_box';
}

class Post {
  String id, name, avater, photo, description,likes,tag,comments,location;

  Post.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        avater = json['avater'],
        photo = json['photo'],
        likes = json['likes'],
        tag = json['tag'],
        comments = json['comments'],
        location = json['location'],
        description = json['description'];

  Map toJson() {
    return {
      'id': id,
      'name': name,
      'avater': avater,
      'photo': photo,
      'likes': likes,
      'tag' : tag,
      'comments' : comments,
      'location' : location,
      'description': description
    };
  }
  //Incoming({required this.id,required this.name,required this.address,required this.email,required this.contact});
}