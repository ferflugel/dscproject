// Code that serves as base for Talent Funding prototype
// code with reference to https://github.com/flutter/plugins/blob/master/packages/google_sign_in/google_sign_in/example/lib/main.dart

// Page imports from the other files. They are just different classes!
import 'package:firebase_auth/firebase_auth.dart';

import 'Homepage.dart';
import 'Profilepage.dart'; // will use this later when we figue thie out.
import 'Forumpage.dart';
import 'Resourcespage.dart';
import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:convert' show json;
import "package:http/http.dart" as http;
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
  ],
);

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prototype',
      home: Prototype(),
    );
  }
}

class Prototype extends StatefulWidget {
  @override
  PrototypeState createState() => PrototypeState();
}

class PrototypeState extends State<Prototype> {
  GoogleSignInAccount? _currentUser;
  String _contactText = '';
  int _selectedPage = 1;
  List _pageOptions = [];

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
        _pageOptions = [
          ProfilePage(_currentUser, _googleSignIn),
          HomePage(_currentUser),
          ForumPage(_currentUser),
          ResourcesPage(_currentUser),
        ];
      });
      // if (_currentUser != null) {
      //   _handleGetContact(_currentUser!);
      // }
    });
    _googleSignIn.signInSilently();
  }

  // Future<void> _handleGetContact(GoogleSignInAccount user) async {
  //   setState(() {
  //     _contactText = "Loading contact info...";
  //   });
  //   final http.Response response = await http.get(
  //     Uri.parse('https://people.googleapis.com/v1/people/me/connections'
  //         '?requestMask.includeField=person.names'),
  //     headers: await user.authHeaders,
  //   );
  //   if (response.statusCode != 200) {
  //     setState(() {
  //       _contactText = "People API gave a ${response.statusCode} "
  //           "response. Check logs for details.";
  //     });
  //     print('People API ${response.statusCode} response: ${response.body}');
  //     return;
  //   }
  //   final Map<String, dynamic> data = json.decode(response.body);
  //   final String? namedContact = _pickFirstNamedContact(data);
  //   setState(() {
  //     if (namedContact != null) {
  //       _contactText = "I see you know $namedContact!";
  //     } else {
  //       _contactText = "No contacts to display.";
  //     }
  //   });
  // }

  // String? _pickFirstNamedContact(Map<String, dynamic> data) {
  //   final List<dynamic>? connections = data['connections'];
  //   final Map<String, dynamic>? contact = connections?.firstWhere(
  //     (dynamic contact) => contact['names'] != null,
  //     orElse: () => null,
  //   );
  //   if (contact != null) {
  //     final Map<String, dynamic>? name = contact['names'].firstWhere(
  //       (dynamic name) => name['displayName'] != null,
  //       orElse: () => null,
  //     );
  //     if (name != null) {
  //       return name['displayName'];
  //     }
  //   }
  //   return null;
  // }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleSignOut() => _googleSignIn.disconnect();

  Widget _buildBody() {
    GoogleSignInAccount? user = _currentUser;
    if (user != null) {
      return 
          Scaffold(
            body: Center(
              child: _pageOptions[_selectedPage],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _selectedPage,
              onTap: (int index) {
                setState(() {
                  _selectedPage = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.people, color: Colors.blueAccent),
                  label: "Forum",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.blueAccent),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person, color: Colors.blueAccent),
                  label: "Profile",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.read_more, color: Colors.blueAccent),
                  label: "Resources",
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => _handleSignOut(),
              child: Icon(Icons.logout, color: Colors.yellow),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniEndTop,
          );

    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const Text("Please sign in to use our app!"),
          ElevatedButton(
            child: const Text('Login'),
            onPressed: _handleSignIn,
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Talent Funding'),
          backgroundColor: Colors.blueAccent,
        ),
        body: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: _buildBody(),
        ));
  }
}
