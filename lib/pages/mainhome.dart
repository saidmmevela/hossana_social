//Author said mmevela

import 'package:flutter/material.dart';
import 'package:hossana_social/custom-buttom_bar/custom_animated_bottom_bar.dart';

class MainHome extends StatefulWidget {
  const MainHome({ Key? key }) : super(key: key);

  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> with TickerProviderStateMixin {

   List<Widget> _pages=<Widget>[
     Icon(
       Icons.home_outlined,
       size: 150,
     ),
     Icon(
       Icons.search_outlined,
       size: 150,
     ),
     Icon(
       Icons.add_box_outlined,
       size: 150,
     ),
     Icon(
       Icons.favorite_outline,
       size: 150,
     ),
     Icon(
       Icons.person_outline,
       size: 150,
     ),
   ];

   int _currentIndex = 0;

   final _inactiveColor = Colors.blueGrey[100]; //variable for the constant color of the inactive tab on the bottom navigation
  final _activeColor= Colors.blue;

  final _navigatorKeys={
    0:GlobalKey<NavigatorState>(),
    1:GlobalKey<NavigatorState>(),
    2:GlobalKey<NavigatorState>(),
    3:GlobalKey<NavigatorState>()
  };

  int _selectedIndex=0;
  late TabController _tabController;

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex=index;
    });
  }
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
          child:_pages.elementAt(_currentIndex),
      ),
        bottomNavigationBar: _buildBottomBar(),
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