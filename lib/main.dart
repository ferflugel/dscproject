// Code that serves as base for Talent Funding prototype
import 'package:flutter/material.dart';

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

class PrototypeState extends State<Prototype> {
  int _selectedPage = 1;
  List _pageOptions = [
    Text('Forum', style: TextStyle(fontSize: 20)),
    HomePage(),
    Text('Profile', style: TextStyle(fontSize: 20))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Talent Funding'),
      ),
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
            icon: Icon(Icons.people),
            label: "Forum",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          )
        ],
      ),
    );
  }

}

// This is the class that will define the HomePage 
class HomePage extends StatelessWidget
{
  @override 
  Widget build(BuildContext context)
  {
    return Text('Homepage', style: TextStyle(fontSize: 20));
  }
}

class Prototype extends StatefulWidget {
  @override
  PrototypeState createState() => PrototypeState();
}
