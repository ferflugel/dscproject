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
  final _key = GlobalKey<FormState>();

  HomePageState(GoogleSignInAccount? user) {
    this.user = user;
  }

  @override
  Widget build(BuildContext context) {
    // Do the editing here

    //return Text('Homepage, list all the projects from the database. Please
    // include a search function here', style: TextStyle(fontSize: 20));
    return Scaffold(
      appBar: AppBar(
        title: Text('Talent Funding'),
        backgroundColor: Colors.amber,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Form(
              key: _key,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Find a project',
                      border: OutlineInputBorder(),
                      filled: true,
                    ),
                  ),
                  ColoredBox(
                      color: Colors.blueAccent,
                      child: RawMaterialButton(
                          onPressed: () {},
                          child: Text('Search',
                              style:
                                  TextStyle(color: Colors.amber, fontSize: 18)),
                          shape: RoundedRectangleBorder()))
                ],
              )),
        ],
      )),
    );
  }
}

class Projects extends StatefulWidget {
  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  List<String> category = ['Project', 'Organization', 'Appreciation'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 25,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: category.length,
            itemBuilder: (context, index) => buildCategory(index)));
  }

  Widget buildCategory(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: Column(children: <Widget>[
        Text(
          category[index],
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        Container(
          height: 7,
        )
      ]),
    );
  }
}
