import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    GoogleSignInAccount? user = this.user;
    // This is where you change the view of the page

    if (user != null) { //This is when you are login
       return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ListTile(
            leading: GoogleUserCircleAvatar(
              identity: user,
            ),
            title: Text(user.displayName ?? ''),
            subtitle: Text(user.email),
          ),
          const Text("Signed in successfully."),
          const Text('Personal Profile, shows the projects that this user is engaged in',
        style: TextStyle(fontSize: 20)),
          //Text(_contactText),
          // ElevatedButton(
          //   child: const Text('REFRESH'),
          //   onPressed: () => _handleGetContact(user),
          // ),
        ],
        //TODO: Insert Profile class here
      ); 

    }else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const Text("Please sign in to use our app!"),
        ],
      );
    }
   
    
  }
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text('Profile ', style: TextStyle(fontSize: 20)),
      Text('', style: TextStyle(fontSize: 30)),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Text('Pic', style: TextStyle(fontSize: 20)),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(color: Colors.blue),
            ),
            height: 100,
            width: 100,
            alignment: Alignment.center,
          ),
          Container(
            child: Text('Skills', style: TextStyle(fontSize: 20)),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.blue),
              borderRadius: BorderRadius.circular(10),
            ),
            height: 200,
            width: 150,
            alignment: Alignment.center,
          ),
        ],
      ),
      Container(
        child: Column(children: [
          Text('About me', style: TextStyle(fontSize: 20)),
          Text('', style: TextStyle(fontSize: 20)),
          Text('Any text describing the person will go here, Anna would replae this variable with data from the datadatabase',
              style: TextStyle(fontSize: 10)),
        ]),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(20),
        width: 300,
        height: 400,
      ), //NEEDS TO IMPROVE
    ]);
  }
}