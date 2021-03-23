import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

// This is the class that will define the Resource Page, Ashely is gonna work on it
class ResourcesPage extends StatefulWidget {
  final GoogleSignInAccount? user;

  ResourcesPage(this.user);

  @override
  ResourcesPageState createState() => new ResourcesPageState(user);
}

//This is where you write the actul function
class ResourcesPageState extends State<ResourcesPage> {
  GoogleSignInAccount? user;

  ResourcesPageState(GoogleSignInAccount? user) {
    this.user = user;
  }

  @override
  Widget build(BuildContext context) {
    // This is where you change the view of the page

    return Text('Resources Page, Ashley wil add her resources here.',
        style: TextStyle(fontSize: 20));
  }
}
