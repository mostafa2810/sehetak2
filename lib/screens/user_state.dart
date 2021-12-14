import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sehetak2/screens/bottom_bar.dart';
import 'package:sehetak2/screens/landing_page.dart';

class UserState extends StatelessWidget {
  const UserState({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        // ignore: missing_return
        builder: (context, userSnapShot) {
          if (userSnapShot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (userSnapShot.connectionState == ConnectionState.active) {
            if (userSnapShot.hasData) {
              print('the user is already active');
              return BottomBarScreen();
            } else {
              print('the user is not  active');
              return LandingPage();
            }
          } else if (userSnapShot.hasError) {
            return Center(
              child: Text('Error occured'),
            );
          }
        });
  }
}
