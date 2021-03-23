import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

// This is the class that will define the Forum, Ashley

class ForumPage extends StatefulWidget {
  final GoogleSignInAccount? user;

  ForumPage(this.user);

  @override
  ForumPageState createState() => new ForumPageState(user);
}

class ForumPageState extends State<ForumPage> {
  GoogleSignInAccount? user;

  ForumPageState(GoogleSignInAccount? user) {
    this.user = user;
  }

  @override
  Widget build(BuildContext context) {
    return Text('Forum Page, have a button to post a discussion thread',
        style: TextStyle(fontSize: 20));
  }
}
