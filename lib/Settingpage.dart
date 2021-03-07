import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

// This is the class that will define the HomePage
class SettingPage extends StatefulWidget {
  final GoogleSignInAccount? user;

  SettingPage(this.user);

  @override
  SettingPageState createState() => new SettingPageState(user);
}

//This is where you write the actul function
class SettingPageState extends State<SettingPage> {
  GoogleSignInAccount? user;

  SettingPageState(GoogleSignInAccount? user) {
    this.user = user;
  }

  @override
  Widget build(BuildContext context) {
    // This is where you change the view of the page

    return Text('Setting page, the acutual setting of the app itself',
        style: TextStyle(fontSize: 20));
  }
}
