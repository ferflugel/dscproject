import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_sign_in/google_sign_in.dart';

// This is the class that will define the Profile Page, Fernando

class ProfilePage extends StatefulWidget {
  final GoogleSignInAccount? user;
  final GoogleSignIn? _googleSignIn;

  ProfilePage(this.user, this._googleSignIn);

  @override
  ProfilePageState createState() => new ProfilePageState(user, _googleSignIn);
}

//This is where you write the actul function
class ProfilePageState extends State<ProfilePage> {
  GoogleSignInAccount? user;
  GoogleSignIn? _googleSignIn;

  ProfilePageState(GoogleSignInAccount? user, GoogleSignIn? _googleSignIn) {
    this.user = user;
    this._googleSignIn = _googleSignIn;
  }

  final List skills = [
    "Moving",
    "Teaching",
    "Python Programming",
    "Dancing",
    "Sleeping"
  ];
  final String aboutme =
      "Hey, I am a cool cat that helps people with learning how to program and makes cool moves. To learn more about me, go to Scratch Website!";
  final String pastworks =
      "I have worked as teaching assistant in a high prestige university. Also helped in the development of several games!";

  @override
  Widget build(BuildContext context) {
    GoogleSignInAccount? user = this.user;
    // This is where you change the view of the page

    if (user != null) {
      //This is when you are login
      return SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          // ListTile(
          //       leading: GoogleUserCircleAvatar(
          //         identity: user,
          //       ),
          //       title: Text(user.displayName ?? ''),
          //       subtitle: Text(user.email),
          //     ),
          Text('', style: TextStyle(fontSize: 30)),
          Text(user.displayName ?? '',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          Text('', style: TextStyle(fontSize: 30)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: CircleAvatar(
                    radius: 65, backgroundImage: AssetImage("cat.png")),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.amber,
                  border: Border.all(color: Colors.blueAccent),
                ),
                height: 130,
                width: 130,
                alignment: Alignment.center,
              ),
              Container(
                child: Column(children: [
                  Text('Skills',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text('', style: TextStyle(fontSize: 20)),
                  Text(
                      '- ' +
                          skills[0] +
                          '\n- ' +
                          skills[1] +
                          '\n- ' +
                          skills[2] +
                          '\n- ' +
                          skills[3] +
                          '\n- ' +
                          skills[4],
                      style: TextStyle(fontSize: 12)),
                ]),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  border: Border.all(color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(bottom: 10),
                height: 150,
                width: 150,
                alignment: Alignment.center,
              ),
            ],
          ),
          Container(
            child: Column(children: [
              Text('About me',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text('', style: TextStyle(fontSize: 20)),
              Text(aboutme, style: TextStyle(fontSize: 12)),
            ]),
            decoration: BoxDecoration(
              color: Colors.amber,
              border: Border.all(color: Colors.blueAccent),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(10),
            width: 350,
            height: 150,
          ), //NEEDS TO IMPROVE
          Container(
            child: Column(children: [
              Text('Past Works',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text('', style: TextStyle(fontSize: 20)),
              Text(pastworks, style: TextStyle(fontSize: 12)),
            ]),
            decoration: BoxDecoration(
              color: Colors.amber,
              border: Border.all(color: Colors.blueAccent),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(10),
            width: 350,
            height: 150,
          ),
          Container(
            child: Row(children: [
              Text("Contact: ",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              Text(user.email, style: TextStyle(fontSize: 14))
            ]),
            decoration: BoxDecoration(
              color: Colors.amber,
              border: Border.all(color: Colors.blueAccent),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(10),
            width: 350,
            height: 60,
          ), //NEEDS TO IMPROVE
        ]),
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const Text("Please sign in to use our app!"),
        ],
      );
    }
  }
}
