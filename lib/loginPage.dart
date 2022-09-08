// ignore_for_file: file_names, prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:whats_good/main.dart';
import 'homePage.dart';
import 'package:whats_good/LandingPage.dart';
import 'SignUp.dart';



class LoginPage extends StatefulWidget{
    @override
    _LoginPageState createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage>{
    final _formKey = GlobalKey<FormState>();
    
    var passwordController  = TextEditingController();
    var emailController  = TextEditingController();
    
    //firebase
    final _auth = FirebaseAuth.instance;
    
    String? errorMessage;

    @override
    Widget build(BuildContext context){
    
    final buildEmail = 
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0,2)
              ),
            ]
          ),
          height: 60,
          
          child: TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value)
            {
              if(value!.isEmpty)
              {
                return ("Please Enter Your Email");
              }
              if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                  .hasMatch(value)) {
                return ("Please Enter a valid email");
              }
              return null;
            },
            onSaved: (value)
            {emailController.text = value!;},
            textInputAction: TextInputAction.next,
            style: TextStyle(
              color: Colors.black87
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top:14),
              prefixIcon: Icon(
                Icons.email,
                color: Color(0xff5ac18e)
              ),
              hintText: 'Email',
              hintStyle: TextStyle(
                color: Colors.black38
              )
            ),
          )
        )
      ]
    );

final buildPassword =
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Password',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold
          
        ),
      ),
      SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0,2)
            ),
          ]
        ),
        height: 60,
        child: TextFormField(
          controller: passwordController,
          obscureText: true,
          //i dunno if the line next is viable with the line above
          keyboardType: TextInputType.visiblePassword ,
          validator: (value) {
            RegExp regex = RegExp(r'^.{6,}$');
            if (value!.isEmpty) {
              return ("Password is required for login");
            }
            if (!regex.hasMatch(value)) {
              return ("Enter Valid Password(Min. 6 Character)");
            }
            //might hafta return null here
          },
          onSaved: (value)
          {passwordController.text = value!;},
          textInputAction: TextInputAction.done,
          style: TextStyle(
            color: Colors.black87
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top:14),
            prefixIcon: Icon(
              Icons.password,
              color: Color(0xff5ac18e)
            ),
            hintText: 'Password',
            hintStyle: TextStyle(
              color: Colors.black38
            )
          ),
        )
      )
    ]
  );


      return Scaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: GestureDetector(
                  child: Stack(
                      children: <Widget>[
                          Container(
                              height: double.infinity,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                          Color.fromARGB(255, 0, 0, 0),
                                          Color.fromARGB(255, 0, 0, 0)
                                         
                                      ]
                                  )
                                  
                                  
                              ),
                              child: SingleChildScrollView(
                                physics: AlwaysScrollableScrollPhysics(),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 25,
                                  vertical: 120
                                ),
                                child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  /*Text(
                                    'What\'s Good',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  */
                                  SizedBox(height:50,),
                                  //for some reason the scale parameter doesn't have any affect on the image asset so we keeping the size
                                  Image.asset("images/logo_2.jpg"),
                                  Text(
                                    "whatsgood",
                                    style: TextStyle(
                                      color:Colors.white,
                                      fontSize: 18,
                                      fontFamily: 'chalk',
                                    ),
                                    ),
                                  SizedBox(height:20),
                                  Form(
                                    key: _formKey,
                                    child:Column(
                                      children: <Widget>[
                                        buildEmail, 
                                        SizedBox(height: 10),
                                        buildPassword,
                                        SizedBox(height:10),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(style:TextStyle(color: Colors.white),"Don't have an account? "),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(context, 
                                                MaterialPageRoute(builder: (context)=> SignUp()));
                                              },
                                              child: Text("sign up",
                                                style: TextStyle(
                                                  color:Colors.redAccent,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )

                                  ),
                                
                                  //sized box acts as padding
                                  SizedBox(height:10),   
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 6,
                                          offset: Offset(0,2)
                                        ),
                                      ],
                                      gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            //NEED TO CHANGE THESE COLORS THEY SUCKKK
                                              Color.fromARGB(102, 4, 73, 116),
                                              Color.fromARGB(153, 25, 115, 193),
                                              Color.fromARGB(204, 23, 201, 255),
                                              Color.fromARGB(255, 9, 226, 255),
                                          ]
                                      )
                                    ),
                                    child: TextButton(
                                      onPressed: (){
                                        signIn(emailController.text, passwordController.text);
                                      },
                                      child: Text('Login',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)
                                      )
                                  ),
                                )
                                //Need to place in a sign up button
                              ],
                            ),
                            ),
                          )
                      ],
                  ),
              ),
          ),
      );
    }
  // login function
  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Login Successful"),
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomePage())),
                });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }
}
