import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/search_bar/gf_search_bar.dart';
import 'package:whats_good/homePage.dart';

class cookHouse extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: <Widget>[
        SingleChildScrollView(
          
          child: Container(
          
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                    Color.fromARGB(102, 248, 63, 22),
                    Color.fromARGB(153, 228, 84, 44),
                    Color.fromARGB(204, 229, 185, 53),
                    Color.fromARGB(255, 229, 176, 43),
                ]
            )
            ), 
          //I need the bottom navigation bar to stick to the bottom of the
          //screen and not go away
          child:BottomNavigationWidget()
        ),
      )
          
        
        
        
        
      ],
    ); 
  }
}


class BottomNavigationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BottomNavigationWidgetState();
}

class BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  
  int _currentIndex = 0;
  List<Widget> pages = List.empty(growable:true);
  

//have to add the leaderboards and profilescreen
  @override
  void initState() {
    pages
      ..add(HomePage());
      //..add(Leaderboards())
      //..add(ProfileScreen());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(label: 'home',icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: 'foodmenu',icon: Icon(Icons.food_bank)),
          //BottomNavigationBarItem(label: 'profile',icon: Icon(Icons.person)),
        ],
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: pages[_currentIndex],
    );
  }
}