import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practise_1/screens/imageSlider.dart';
import 'package:flutter_practise_1/screens/navBar.dart';


class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
       builder:(context,snapshot) {
        if(snapshot.hasData){
          return const BottomNavBar();
        }
        else{
          return Imageslider();
        }
       }),
    );
  }
}