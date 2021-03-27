import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

// This is the class that will define the Resource Page, Ashely is gonna work on it
class ResourcesPage extends StatefulWidget {
  final GoogleSignInAccount? user;

  ResourcesPage(this.user);

  @override
  ResourcesPageState createState() => new ResourcesPageState(user);
}


class ResourcesPageState extends State<ResourcesPage> {
  GoogleSignInAccount? user;

  ResourcesPageState(GoogleSignInAccount? user) {
    this.user = user;
  }

  final ScrollController _scrollController = ScrollController();

  void _scrollToSelectedContent(bool isExpanded, double previousOffset, int index, GlobalKey myKey) {
    final keyContext = myKey.currentContext;

    if (keyContext != null) {
      // make sure that your widget is visible
      final box = keyContext.findRenderObject() as RenderBox;
      _scrollController.animateTo(isExpanded ? (box.size.height * index) : previousOffset,
          duration: Duration(milliseconds: 500), curve: Curves.linear);
    }
  }

  List<Widget> _buildExpansionTileChildren() => [
        FlutterLogo(
          size: 50.0,
        ),
        Text(
          'Resource item and description, link to the resources',
          textAlign: TextAlign.justify,
        ),
      ];

  ExpansionTile _buildExpansionTile(int index) {
    final GlobalKey expansionTileKey = GlobalKey();
    double previousOffset = 0.00;
    int display_index = index + 1;

    return ExpansionTile(
      key: expansionTileKey,
      onExpansionChanged: (isExpanded) {
        if (isExpanded) previousOffset = _scrollController.offset;
        _scrollToSelectedContent(isExpanded, previousOffset, index, expansionTileKey);
      },
      title: Text('Resource $display_index'),
      children: _buildExpansionTileChildren(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resources'),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: 26, 
        itemBuilder: (BuildContext context, int index) => _buildExpansionTile(index),
      ),
    );
  }
}