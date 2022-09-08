import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:whats_good/homePage.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      height: double.infinity,
      width: double.infinity,
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
      child:
        Stack(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 100),
                  const Text("What\'s Good",style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold
            )),
            const SizedBox(width: 15, height: 15),
            Container(
              decoration: BoxDecoration(border: Border.all(color: Color(3340028),width:8.0)),
              child: 
              Row(
                children: <Widget>[
                  SizedBox(
                    height: 100,
                    width: 300,
                    child: TextField(  
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    hintText: 'Address',
                    fillColor: Colors.white,
                    focusedBorder:OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                ),
            ),
                  ),
                  Transform.translate(
                    offset: Offset(10,-20),
                    child: GestureDetector(
                      child: Icon(Icons.arrow_forward, size: 40.0,),
                      onTap: (){Navigator.push(context, MaterialPageRoute(builder:(context) => HomePage()));}
                    ),
                  ),
                ],
              ),  
            ),
            const SizedBox(width: 15, height: 15),
                ],
              ),
            ) 
          ],
        ),
    ),
    );
     
  }
}