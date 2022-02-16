//Author said mmevela
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hossana_social/pages/User.dart';
import 'package:hossana_social/pages/signup.dart';
import 'package:http/http.dart' as http;
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _formKey =GlobalKey<FormState>();
late Box box1;
late Box<User> box2;
//List<User> Register=[];
   //formfield controller variables;
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();

  void login()async{
      var reg =box1.get('registers');
      var contain =reg.where((element)=>element.username == _username.text);
      if(contain.isEmpty){
        print("no match");
      }else{
        print("match");
        box1.put('isLogged', true);
        box1.put('username', _username.text);
      }
      //box1.put('Fname', []);
      //box1.put('username', "username");
      //box1.put('isLogged', true);
      //print("isLogged: ${box1.get('isLogged')}");
  }
    
  void createBox() async {
    box1 = await Hive.openBox('user');
    box2 = await Hive.openBox<User>('registers');
  }

  @override
  void initState() {
    super.initState();
    createBox();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            
            children: [
              SizedBox(height: MediaQuery.of(context).size.height/4),
              Center(child: Text("Login",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueGrey[900],fontSize: 20),)),
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
                        controller: _username,
                        decoration: const InputDecoration(
                            hintText: "Username",
                            enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                          
                          ),
                        validator:(username){
                          if(username!.isEmpty){
                            return "Please enter username";
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
                        controller: _password,
                        decoration: const InputDecoration(
                          hintText: "password",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Colors.white),
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
                    SizedBox(height: 15),
                    OutlinedButton(
                      child: Container(
                        width:MediaQuery.of(context).size.width/1.5,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Center(child: Text("Login")),
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
                            
                          login();
                        }
                        
                      }
                      
                    ), 
                    SizedBox(height: 15),
                    Text("Don't have an account?",style: TextStyle(color:Colors.blueGrey[300]),),
                    TextButton(
                      child: Text("Sign up",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,fontSize: 15),),
                      
                      onPressed: (){
                          //route();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => signup()));
                      },
                    
                    )
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