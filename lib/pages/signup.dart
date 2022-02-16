//Author said mmevela
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
                            //login();
                            
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