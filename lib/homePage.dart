
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:getwidget/getwidget.dart';
import '/setOfFoodPlaces/104West.dart';
import 'package:whats_good/setOfFoodPlaces/beckerHouse.dart';
import '/setOfFoodPlaces/cookHouse.dart';

//plan rn is to populate the first mini stage with cornell dining places for college students to rate and use the app
//this is the debut of "What's good"
//people could contribute to the app by adding places that's near them to gain points




/*Define a review, couldn't find a widget so making my own
img is the pfp img
these review widgets are gonna populate a review arraylist that will go in the full page of each food place
*/
Widget review(Review rev){
  String img = rev.imgLink;
  String text = rev.text;
  return Row(
    children: <Widget>[
      Image.asset(img, height: 30, width: 30),
      Text(text, style: TextStyle(color: Colors.white))
    ],
  );
}
//Widget popularReview(){
  //return review(img, text);
//}
//the img should be the pfp image and not the restaurant, the restaurant img is only to see if the code is working
class Review  {
  String imgLink;
  String text;

  Review({required this.imgLink, required this.text});
}
//use smaller images
List<Review> reviews = [
  Review(imgLink: 'images/default_pfp.jpg', text: 'This place is superb, try the frozen yogurt')
];

/*Defining features of a foodCard
Name, image, rating, route when clicked, bio of food place
array of reviews with the people that wrote them
*/

/*stuff to update:
set the size of the images in the Image.asset widget portion of the foodcard
we want there to only be one size to make the app look nice
*/
//reformat this into a widget
class foodCard extends StatelessWidget {
  final name;
  final img;
  final route;
  final bio;
  final rating;
  const foodCard({
    Key? key,
    this.name,
    this.img,
    this.route,
    this.bio,
    this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
      //first container needs borders
      
      return Column(
        
        children: <Widget>[
          Text(name, 
            style: const TextStyle(
              fontSize: 30,
              color: Colors.white,
              //fontFamily: 'spitshine',
            ) ),
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              
              border: Border.all(
                color: Colors.white,
                width: 4
            )),
            child: GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => route));
            }, 
            child: Image.asset(img)
          )),
          SizedBox(height: 45,child:Text(bio,style:const TextStyle(color: Colors.white))),
          GFRating(
      //padding: EdgeInsets.symmetric(vertical: 35),
            value: rating,
            onChanged: (value) {
    //can use this parameter to change the stars but don't need rn so we leave blank
            },
          ), 
        ],
      );
    //the row below is the rating portion
  }
}

/*foodCard(name,img,route,bio,rating)

{

  return Column(

    children:<Widget>[
      //first container needs borders
      Column(
        children: <Widget>[
          Text(name, 
            style: const TextStyle(
              fontSize: 30,
              //fontFamily: 'spitshine',
            ) ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 4
            )),
            child: GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => route));
                }, 
            child: Image.asset(img, height: 300, width: 300)
          )),
          Text(bio)
          
        ],
      ),
    //the row below is the rating portion
    GFRating(
  value: rating,
  onChanged: (value) {
    //can use this parameter to change the stars but don't need rn so we leave blank
  },
),
    review(reviews[0])

    ]
  );
}
*/
class HomePage extends StatefulWidget {
  

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Whats Good")),
      body:
        
          
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                        Color.fromARGB(255, 0, 0, 0),
                        Color.fromARGB(255, 0, 0, 0),
                        
                    ]
                )
            ),
            child: Stack(
              children: <Widget>[
                
              //This is where u insert all the goddamn widgets u want
                GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 0.0,
                  childAspectRatio: .5,
                  children: <Widget>[
                    foodCard(name:'104west', img:'images/104West.jpg', route:west104() , bio:'I wish 104West would open sooner', rating:4.0),
                    foodCard(name:'BeckerHouse', img:'images/BeckerHouse.jpg',route:beckerhouse(), bio: 'The becker house i guess', rating:3.0),
                    foodCard(name:'CookHouse',img:'images/cookhouse.jpg', route:cookHouse(),bio:'This is cookHouse', rating: 5.0)
                  ],
                  ),
                



              ],
            ),
            
              
              
              )
          );
          
        
      
    
  }
}