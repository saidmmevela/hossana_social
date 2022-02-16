//Author said mmevela
import 'package:flutter/material.dart';
import 'package:hossana_social/pages/User.dart';
import 'package:hossana_social/pages/login.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:hossana_social/pages/mainhome.dart';

late Box box1;
late Box<User> box2;
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  box1 = await Hive.openBox('user');
  //box2 = await Hive.openBox<User>('registers');
  
 // await Hive.openBox<User>(HiveBoxes.registers);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  // This widget is the root of Hossana Application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
            child:ValueListenableBuilder(
                valueListenable: box1.listenable(),
                builder: (BuildContext context, Box box, Widget) {
                  return box1.get('isLogged', defaultValue: false)
                      ? MainHome()
                      :Login();
                })
            ),
        )
      );
  }
}
//Author said mmevela