//Author said mmevela
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hossana_social/pages/Post.dart';
import 'package:hossana_social/pages/User.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _formKey =GlobalKey<FormState>();

  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();

  List<Post> posts=[];

  void getPost() async{
        String bytes = await rootBundle.loadString('assets/Posts.json');
  
      
      //  print('class2:${data[0]}');
       // print('class3:${data[0].course_name}');
      
    setState(() {
      Iterable pst =json.decode(bytes);
      posts=pst.map((model)=>Post.fromJson(model)).toList();
     // print('post:${posts.length}');
    });

  }

@override
  void initState() {
    super.initState();
    getPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black12,
        child: ListView(
          children: [
            Container(
              color: Colors.white,
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                     padding: const EdgeInsets.all(4.0),
                     child: Column(
                            children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 4),
                                  child: Container(
                                    width:58,
                                    height:58,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border:Border.all(color: Colors.grey,width: 3),
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    child: Center(child: Icon(Icons.add,color: Colors.grey,)),
                                  ),
                                ),
                                Text("My Story",style:TextStyle(fontSize: 13,fontWeight:FontWeight.bold,))
                            ],
                          ),
                  ),
                  Row(
                    children:List.generate(5, (index){
                        return
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 4),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border:Border.all(color: Colors.green,width: 3),
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(1.0),
                                        child: ClipRRect(
                                            borderRadius: BorderRadius.circular(15),
                                              child:Image(image:AssetImage("images/pexels-jovin-gerald-10840765.jpg"),
                                              width:50,
                                              height:50,
                                              fit: BoxFit.cover,
                                            
                                            ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text("Alice",style:TextStyle(fontSize: 13,fontWeight:FontWeight.bold,))
                              ],
                            ),
                          );
                    }
                  ),
                  ),
                ],
              )
             ),
             SizedBox(height: 5),
            Column(
              children:List.generate(posts.length, (index){
                return
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context)=>
                          Posts(name:posts[index].name,description: posts[index].description,location: posts[index].location,avater: posts[index].avater,photo: posts[index].photo,comments: posts[index].comments,likes: posts[index].likes,tag: posts[index].tag,),
                         
                        )
                      );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8,bottom: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8,left: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children:[
                                            CircleAvatar(
                                                  radius:20,
                                                  child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(50),
                                                      child: Image(
                                                    image:AssetImage(posts[index].avater),
                                                    height:50,
                                                    width:50,
                                                    fit: BoxFit.cover,
                                                  
                                                  ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 8),
                                                  child: Column(
                                                    mainAxisAlignment:MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                    Text(
                                                        posts[index].name,
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 15,
                                                          
                                                        ),
                                                    ),
                                                    Text(
                                                        posts[index].location,
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.grey
                                                          
                                                        ),
                                                    )
                                                  ],)
                                                  ,
                                                ) ,
                                          ]
                                                
                                        ),
                                        Icon(Icons.more_vert,color: Colors.black45,)
                                      ],
                                    ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10,left: 10,top: 4),
                                child: Text(
                                    posts[index].description,
                                    style: TextStyle(
                                      //fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                            
                                          ),
                                      ),
                                    ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8,bottom: 8),
                                  child: Image(
                                  // FadeInImage.assetNetwork(
                                  // placeholder: 'images/default.png', 
                                  // image: 'https://picsum.photos/250?image=9'
                                    image:AssetImage(posts[index].photo),
                                    //height:50,
                                    //fit: BoxFit.fill,
                                  
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8,left: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.favorite_border,color: Colors.black45,),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 8),
                                          child: Text(posts[index].likes),
                                        ),
                                        Icon(Icons.chat_outlined,color: Colors.black45,),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 8),
                                          child: Text(posts[index].comments),
                                        ),
                                        Icon(Icons.bookmark_outline,color: Colors.black45,),
                                        Text(posts[index].tag),
                                      ],
                                    ),
                                    Icon(Icons.send,color: Colors.black45,),
                                  ],
                                ),
                              ),
                              
                                  ]
                          ),
                        ),
                      ),
                  ),
                );
              }
              )
              ),
            
           ],
        ),
      ),
    );
  }
}
//Author said mmevela