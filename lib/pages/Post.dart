//Author said mmevela


import 'package:flutter/material.dart';
import 'package:hossana_social/pages/User.dart';

class Posts extends StatefulWidget {
  final name;
  final description;
  final likes;
  final photo;
  final tag;
  final comments;
  final avater;
  final location;
  Posts({this.name,this.description,this.avater,this.comments,this.likes,this.location,this.photo,this.tag});

  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {

  final _formKey =GlobalKey<FormState>();

  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();

  List<Post> posts=[];

  

@override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Post"),
      ),
      body: Container(
        color: Colors.black12,
        child: ListView(
          children: [
            
                Padding(
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
                                                  image:AssetImage(widget.avater),
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
                                                      widget.name,
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 15,
                                                        
                                                      ),
                                                  ),
                                                  Text(
                                                      widget.location,
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
                                  widget.description,
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
                                  image:AssetImage(widget.photo),
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
                                        child: Text(widget.likes),
                                      ),
                                      Icon(Icons.chat_outlined,color: Colors.black45,),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 8),
                                        child: Text(widget.comments),
                                      ),
                                      Icon(Icons.bookmark_outline,color: Colors.black45,),
                                      Text(widget.tag),
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
              Column(
                children: List.generate(4, (index){
                  //var owner=comments[index].owner;
                  return
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration:BoxDecoration(
                        color: Colors.blueGrey[50],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius:20,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(50),
                                                child: Image(
                                                  image:AssetImage("images/pexels-camille-robinson-10822203.jpg"),
                                              height:50,
                                              width:50,
                                              fit: BoxFit.cover,
                                            
                                            ),
                                            ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(index==0?"John Doe":index==2?"Jane Doe":"James Doe",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueGrey[700])),
                                              Text(
                                                  "1 Hour ago",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    
                                                  ),
                                              ),
                                             ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Text(
                                    "nice",
                                    style: TextStyle(
                                      fontSize: 15,
                                      
                                    ),
                                ),
                              ],
                            )
                          
                        ) ,
                      ),
                    );
                }
                )
              )
            
           ],
        ),
      ),
    );
  }
}
//Author said mmevela