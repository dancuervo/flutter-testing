import 'package:flutter/material.dart';

class MyNewTodo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New To Do'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: Center(
                    child: RaisedButton(
                      onPressed: ()=>{ Navigator.pop(context) },
                      child: Text('Back'),
                    ),
                  )
                ),
              ],
            )
          ],
        ),
      );
    }
  }
