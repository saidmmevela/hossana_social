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