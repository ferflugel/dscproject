import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


// This is the class that will define the HomePage, Samira
// Just displaying the projects
class HomePage extends StatefulWidget {
  final GoogleSignInAccount? user;

  HomePage(this.user);

  @override
  HomePageState createState() => new HomePageState(user); 
}

class HomePageState extends State<HomePage> {
  GoogleSignInAccount? user;

  HomePageState(GoogleSignInAccount? user) {
    this.user = user;
  }

  @override
  Widget build(BuildContext context){ // Do the editing here

  return Text('Homepage, list all the projects from the database. Please include a search function here', style: TextStyle(fontSize: 20));
  }
}