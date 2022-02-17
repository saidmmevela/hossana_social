//Author said mmevela

import 'package:flutter/material.dart';
import 'package:hossana_social/custom-buttom_bar/custom_animated_bottom_bar.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hossana_social/pages/home.dart';

class MainHome extends StatefulWidget {
  const MainHome({ Key? key }) : super(key: key);

  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> with TickerProviderStateMixin {

  

   int _currentIndex = 0;

   final _inactiveColor = Colors.blueGrey[100]; //variable for the constant color of the inactive tab on the bottom navigation
  final _activeColor= Colors.blue;

 

  late TabController _tabController;


  late Box box1;
  
  void createBox() async {
    box1 = await Hive.openBox('user');
    
  }

  
  
  @override
  void initState() {
    super.initState();
    createBox();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.menu,color: Colors.grey,size: 35,),
            Icon(Icons.history_edu_outlined,color: Colors.black,size: 35,),
            Icon(Icons.chat_outlined,color: Colors.grey,size: 35,)
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body:SafeArea(child:getBody(),),
        bottomNavigationBar: _buildBottomBar(),
    );

  }

  getBody() {
     
    List<Widget> pages = [
     Home(),
     Center(
       child: Icon(
         Icons.search_outlined,
         size: 150,
       ),
     ),
     Center(
       child: Icon(
         Icons.add_box_outlined,
         size: 150,
       ),
     ),
     Center(
       child: Icon(
         Icons.favorite_outline,
         size: 150,
       ),
     ),
     Center(
       child: Container(
         child: InkWell(
                  onTap:(){
                    box1.put('isLogged',false);
                    box1.delete('username');
                    print("object");
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration:BoxDecoration(
                        color: Colors.blueGrey[50],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: Text("Log Out",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueGrey[700])),
                      ),
                    ),
                  ),
                ),
       ),
     )
      
    ];
    return IndexedStack(
      index: _currentIndex,
      children: pages,
    );
  }
  
  Widget _buildBottomBar(){
  

  //_buildBottomBar({required this.isar});
    return CustomAnimatedBottomBar(
      containerHeight: 60,
      backgroundColor: Colors.white,
      selectedIndex: _currentIndex,
      showElevation: true,
      itemCornerRadius: 24,
      curve: Curves.easeIn,
      onItemSelected: (index) async {
        
        setState(() => _currentIndex = index);
         // _navigatorKeys[_currentIndex]!.currentState!.popUntil((route)=>route.isFirst);
        },
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: Icon(Icons.home_outlined),
          //activeIcon:Icon(Icons.home_rounded),
          //title: Text('Home'),
          activeColor: _activeColor,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.search_outlined),
         // activeIcon:Icon(Icons.library_books_outlined),
         // title: Text('Notification'),
          activeColor: _activeColor,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
          
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.add_box_outlined),
         // activeIcon:Icon(Icons.library_books_outlined),
         // title: Text('Notification'),
          activeColor: _activeColor,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
          
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.favorite_outline),
         // activeIcon:Icon(Icons.cancel_presentation_rounded),
          //title: Text('Favourites ',),
          activeColor: _activeColor,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
          
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.person_outline),
          //activeIcon:Icon(Icons.notifications),
          //title: Text('User'),
          activeColor: _activeColor,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
          
        ),
        
      ],
      iconSize:30,
    );
  }

}