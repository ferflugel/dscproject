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

  var topCategoyIcons = new Container(
    alignment: Alignment.center,
    decoration: new BoxDecoration(
        gradient: new LinearGradient(
      colors: [
        Colors.deepPurple,
        Colors.deepPurple
      ],
      begin: const FractionalOffset(0.0, 0.0),
      end: const FractionalOffset(0.0, 1.0),
      stops: [0.0, 1.0],
      tileMode: TileMode.clamp,
    )),
    child: new Container(
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 0.0,
      ),
      decoration: new BoxDecoration(
        color: Colors.grey[300],
        // border: new Border.all(color: Colors.black, width: 1.0),
        borderRadius: new BorderRadius.only(
          topLeft: new Radius.circular(30.0),
          topRight: new Radius.circular(30.0),
        ),
      ),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new CategoryIcon(Icons.school, "Tutorials", true),
          new CategoryIcon(Icons.public, "Jobs", false),
          new CategoryIcon(Icons.speaker_notes, "Chat", false),
          new CategoryIcon(Icons.place, "Local groups", false),
        ],
      ),
    ),
  );

  var categoryMetric = new Container(
    padding: const EdgeInsets.all(5.0),
    margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 15.0),
    decoration: new BoxDecoration(
      gradient: new LinearGradient(
        colors: [
          Colors.grey,
          Colors.grey
        ],
        begin: const FractionalOffset(0.0, 0.5),
        end: const FractionalOffset(0.0, 1.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp,
      ),
      // border: new Border.all(color: Colors.black, width: 1.0),
      borderRadius: new BorderRadius.only(
        bottomLeft: new Radius.circular(30.0),
        bottomRight: new Radius.circular(30.0),
      ),
    ),
    child: new Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new CategoryIcon(Icons.build, "Projects", false),
        new CategoryIcon(Icons.question_answer, "Questions", false),
        new CategoryIcon(Icons.calendar_today, "Events", false),
        new CategoryIcon(Icons.person, "Profile", false),
      ],
    ),
  );

  static final listItemsData = [
    new ListEntry("Chat", "Welcome to Flutter!", "I am a new Flutter developer. Any advice?", 54, 2, true),
    new ListEntry("Local Groups", "GDG Rochester", "Join us on June 1st for the International Flutter Hackathon!",  154, 3,false),
    new ListEntry("Projects", "My cool app", "It took a long time, but I just released my newest app", 971, 0, false),
  ];
  var listView = new ListView.builder(
    itemBuilder: (BuildContext context, int index) =>
        new EntryItem(listItemsData[index]),
    itemCount: listItemsData.length,
    shrinkWrap: true,
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: false,
        elevation: 0.0,
        //title: new Text(
          //widget.title,
          //textScaleFactor: 1.3,
        //),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search),
            onPressed: _onSearchPressed,
          ),
        ],
      ),
      body: new Container(
        child: new ListView(
          children: <Widget>[topCategoyIcons, categoryMetric, listView],
          shrinkWrap: true,
        ),
      ),
    );
  }
  void _onSearchPressed() {
    Navigator.pop(context);
  }
}

class ListEntry {
  final String title;
  final String icon;
  final String description;
  final int views;
  final int responses;
  final bool answered;

  ListEntry(this.title, this.icon, this.description, this.views, this.responses, this.answered);
}

class CategoryIcon extends StatelessWidget {
  const CategoryIcon(this.icon, this.iconText, this.selected);

  final String iconText;
  final IconData icon;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
        children: <Widget>[
          new IconButton(
            icon: new Icon(icon),
            onPressed: _onSearchPressed,
            color: selected == true
                ? Colors.deepPurple
                : Colors.black,
          ),
          new Text(iconText)
        ],
      ),
    );
  }

  static void _onSearchPressed() {
  }
}

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final ListEntry entry;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.all(3.0),
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
      decoration: new BoxDecoration(
        color: Colors.grey[300],
        borderRadius: new BorderRadius.all(new Radius.circular(15.0)),
      ),
      child:
          new ListTile(
            title:
          new Column(
            children: <Widget>[
              new Container(
                decoration: new BoxDecoration(
                  color: Colors.blue[300],
                  borderRadius: const BorderRadius.only(
                      topLeft: const Radius.circular(20.0),
                      topRight: const Radius.circular(20.0)),
                ),
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Text(
                              entry.title
                          ),
                        ],
                      ),
                    ),
                    new Row(
                      children: <Widget>[
                        new Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: new Icon(Icons.remove_red_eye),
                        ),
                        new Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: new Text(entry.views.toString()),
                        ),
                        new Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: new Icon(Icons.speaker_notes),
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(right: 8.0, left: 2.0),
                          child: new Text(entry.responses.toString()),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              new Container(
                margin: const EdgeInsets.only(left: 2.0,right: 2.0,bottom: 2.0),
                padding: const EdgeInsets.all(8.0),
                decoration: new BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: const BorderRadius.only(bottomLeft :const Radius.circular(20.0),bottomRight :const Radius.circular(20.0))
                ),
                child: new Text(entry.description),
              ),
            ],
          ),
        onTap: () {Navigator.pushNamed(context, '/forum/1');},
      ),
    );
  }
}