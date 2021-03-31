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

//Project form that company can fill in
class _ProjectsState extends State<Projects> {
  TextEditingController _projectname = TextEditingController();
  TextEditingController _company = TextEditingController();
  TextEditingController _position = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _requirement = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom:15,left: 10,right: 10),
                  child: TextFormField(
                    controller: _projectname,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.wallet_travel_rounded),
                        hintText: "Project Name"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                  child: TextFormField(
                    controller: _company,
                    keyboardType: TextInputType.text,
                    decoration:InputDecoration(
                        prefixIcon: Icon(Icons.account_balance_outlined),
                        hintText: "Company"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                  child: TextFormField(
                    controller: _position,
                    keyboardType: TextInputType.text,
                    decoration:InputDecoration(
                        prefixIcon: Icon(Icons.account_circle_rounded),
                        hintText: "Position"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                  child: TextFormField(
                    controller: _description,
                    keyboardType: TextInputType.text,
                    decoration:InputDecoration(
                        prefixIcon: Icon(Icons.category),
                        hintText: "Description"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                  child: TextFormField(
                    controller: _requirement,
                    keyboardType: TextInputType.text,
                    decoration:InputDecoration(
                        prefixIcon: Icon(Icons.assignment_turned_in),
                        hintText: "Requirement"),
                  ),
                ),
          Form(
              key: _formkey,
              child: Column(
                children: [
                  ColoredBox(
                      color: Colors.blueAccent,
                      child: RawMaterialButton(
                          onPressed: () {},
                          child: Text('Create',
                              style:
                              TextStyle(color: Colors.amber, fontSize: 18)),
                          shape: RoundedRectangleBorder()))
                ],
              )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
