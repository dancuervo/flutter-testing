import 'package:flutter/material.dart';
import 'package:teamz/ViewContacts.dart';
import 'package:teamz/ViewTeamz.dart';
import 'package:teamz/ViewFeed.dart';
import 'package:teamz/ViewToDo.dart';
import 'package:teamz/ViewContacts.dart';
import 'package:teamz/ViewNewTodo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MyScaffold(),
      ),
    );
  }
}
class MyScaffold extends StatefulWidget {
  @override
  _MyScaffoldState createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
  int _currentIndex = 0;
  final List<Widget>screens = [
    MyFeed(),
    MyToDo(),
    MyTeamz(),
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Teamz'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(child:Text('Teamz', style: TextStyle(color: Colors.white, fontSize: 30),), decoration: BoxDecoration(color: Colors.blueAccent),)
          ],
        ),
      ),
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index){
          setState(() {
            _currentIndex = index;
            screens[index];
          });
        },
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.whatshot),
            title: Text('Feed'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.playlist_add),
            title: Text('Note'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle),
            title: Text('Teamz'),
          ),
        ],
      ),
    );
  }
}
