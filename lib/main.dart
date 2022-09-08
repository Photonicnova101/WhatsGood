
// ignore_for_file: use_key_in_widget_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'loginPage.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

//added the async modifier here to comply with the bugs
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(start());
}

class start extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            
            title:' ',
            theme:ThemeData(
                primaryColorDark:Colors.black,
                fontFamily: 'BubblegumSans',
                accentColor: Colors.redAccent[700],
                backgroundColor:Colors.white
            ),
            home: LoginPage(),
        );
    }
}

