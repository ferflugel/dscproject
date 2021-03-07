import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

// This is the class that will define the Profile Page
class ProfilePage extends StatefulWidget {
  final GoogleSignInAccount? user;
  final GoogleSignIn _googleSignIn;

  ProfilePage(this.user, this._googleSignIn);

  @override
  ProfilePageState createState() => new ProfilePageState(user, _googleSignIn);
}

//This is where you write the actul function
class ProfilePageState extends State<ProfilePage> {
  GoogleSignInAccount? user;
  GoogleSignIn? _googleSignIn;

  ProfilePageState(GoogleSignInAccount? user, GoogleSignIn _googleSignIn) {
    this.user = user;
    this._googleSignIn = _googleSignIn;
  }

  @override
  Widget build(BuildContext context) {
    // This is where you change the view of the page
    return Text(
        'Personal Profile, shows the projects that this user is engaged in',
        style: TextStyle(fontSize: 20));
  }
}
