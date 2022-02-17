//Author said mmevela

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hossana_social/pages/User.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class signup extends StatefulWidget {
  
  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
   final _formKey =GlobalKey<FormState>();

  // late TabController _tabController;
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordController1 = TextEditingController();
 
 dynamic _value = 1;
 dynamic _value1 = 1;
 bool load =false;

  List<User> Register=[];

 late Box box1;
 //late Box<User> box2;
 void register()async{
      
     //var reg=box2.getAt(0);
     //Box<User> box2=Hive.box<User>(HiveBoxes.registers);
      var reg=box1.get("registers",defaultValue:Register);
      reg.add(User(fullname: _fullNameController.text, username: _usernameController.text, password: _passwordController.text, id: '${_usernameController.text}${_passwordController.text}'));
      box1.put("registers",reg);
     //await box2.add(User(fullname: _fullNameController.text, username: _usernameController.text, password: _passwordController.text, id: '${_usernameController.text}${_passwordController.text}'));
      print("isLogged: ${Register.length}");
      //print("isLogged: ${reg}");
      //print("isLogged: ${box2.values.length}");
      print("isLogged: ${Register[0].fullname}");
      showDialog<String>(
        context: context, 
        barrierDismissible: false,
        builder: (BuildContext context){
          return AlertDialog(
            title: const Text("Success Signup"),
            //content: const Text("Welcome"),
            actions: <Widget>[
              TextButton(
              onPressed:(){
                Navigator.of(context).pop();
                Navigator.pop(context);
              }, 
              child: const Text("ok")),
            ],
          );
        }
      );
  }

  void createBox() async {
    box1 = await Hive.openBox('user');
   // box2 = await Hive.openBox<User>('registers');
  }

  @override
  void initState() {
    super.initState();
    createBox();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Signup",
       // title:Text("Vacinnes",
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
            ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
           // mainAxisAlignment: MainAxisAlignment.center,
           // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 35),
              Form(
                key:_formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width/1.3,
                      decoration:BoxDecoration(
                        color: Colors.blueGrey[50],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: _fullNameController,
                        decoration: const InputDecoration(
                            hintText: "Full name",
                            enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Colors.blueAccent),
                          ),
                          contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                          
                          ),
                        validator:(username){
                          if(username!.isEmpty){
                            return "Please enter full name";
                          }
                          return null;
                        }
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: MediaQuery.of(context).size.width/1.3,
                      decoration:BoxDecoration(
                        color: Colors.blueGrey[50],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: _usernameController,
                        decoration: const InputDecoration(
                            hintText: "Username",
                            enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Colors.blueAccent),
                          ),
                          contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                          
                          ),
                        validator:(address){
                          if(address!.isEmpty){
                            return "Please enter Username";
                          }
                          return null;
                        }
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: MediaQuery.of(context).size.width/1.3,
                      decoration:BoxDecoration(
                        color: Colors.blueGrey[50],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          hintText: "Enter password",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Colors.blueAccent),
                          ),
                          contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10)
                          ),
                          
                        obscureText: true,
                        validator:(password){
                          if(password!.isEmpty){
                            return "Please enter password";
                          }
                          return null;
                        }
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: MediaQuery.of(context).size.width/1.3,
                      decoration:BoxDecoration(
                        color: Colors.blueGrey[50],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: _passwordController1,
                        decoration: const InputDecoration(
                          hintText: "Confirm password",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Colors.blueAccent),
                          ),
                          contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10)
                          ),
                          
                        obscureText: true,
                        validator:(cpassword){
                          if(cpassword!.isEmpty){
                            return "Please confirm password";
                          }
                          else if(_passwordController1.text !=_passwordController.text){
                            return "Please password must match";
                          }
                          return null;
                        }
                      ),
                    ),
                    SizedBox(height: 15),
                    load?Center(child: CircularProgressIndicator()):
                    OutlinedButton(
                      child: Container(
                        width:MediaQuery.of(context).size.width/1.5,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Center(child: Text("Sign up")),
                        )
                      ),
                      style: OutlinedButton.styleFrom(
                        primary: Colors.white,
                        onSurface: Colors.red,
                        
                        backgroundColor: Colors.blue,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(9)),
                        )
                      ),
                      
                      onPressed: () async {
                        if(_formKey.currentState!.validate()){
                            // print("object");
                            setState(() {
                              Register=[
                                User(fullname: _fullNameController.text, username: _usernameController.text, password: _passwordController.text, id: '1')
                              ];
                            });
                            register();
                            
                        }
                        
                        
                      }
                      
                    ),
                   
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//Author said mmevela