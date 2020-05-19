import 'package:flutter/material.dart';
import './ViewContacts.dart';

class MyTeamz extends StatefulWidget {
  @override
  _MyTeamzState createState() => _MyTeamzState();
}

class _MyTeamzState extends State<MyTeamz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Text('TEAMZ'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: ()=>{ Navigator.push(context, MaterialPageRoute(builder: (context) => MyContacts())) },
      )
      ,
    );
  }
}
