import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/search_bar/gf_search_bar.dart';
import 'package:whats_good/homePage.dart';

class west104 extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:
          Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                    Color.fromARGB(255, 0, 0, 0),
                    Color.fromARGB(255, 150, 75, 75),
                ]
            )
            ), 
          //I need the bottom navigation bar to stick to the bottom of the
          //screen and not go away
          child:Column( 
            children: <Widget>[
              Container(
                width: 1000,
                child: Text('West104',style: TextStyle(fontSize: 30,color: Colors.white,fontFamily: 'spitShine'),),
              ),
              Image.asset('images/104West.jpg',scale:2.0,height:200,width:400),
              SizedBox(height:50),
              review(reviews[0]),
              //bottomnavbar weird rn
              
            ]
          )
        ),
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
      ..add(west104());// i think these statements are to route the icons on the bottom nav bar but now i dunno
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
