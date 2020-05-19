import 'package:flutter/material.dart';

class MyFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: <Widget>[
          MyFeedCards(),
          //RaisedButton(child: Text("To Dos"), onPressed: ()=>{Navigator.pushNamed(context, '/toDo')}),
        ],
      ),
    );
  }
}

class MyFeedCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Card(
          child: InkWell(
            splashColor: Colors.deepPurpleAccent,
            onLongPress: (){  },
            child: Column(
          children: <Widget>[
          ListTile(
            leading: Icon(Icons.whatshot, color: Colors.deepPurpleAccent,),
          title: Text('Encontro com Sctria Cultura'),
          subtitle: Text('Projeto XPTO - Meetings'),
        ),
        ButtonBar(
          children: <Widget>[
            FlatButton(onPressed: null, child: Icon(Icons.edit, color: Colors.greenAccent,),),
            FlatButton(onPressed: null, child: Icon(Icons.share, color: Colors.blueAccent,),),
            FlatButton(onPressed: null, child: Icon(Icons.delete, color: Colors.redAccent,),)
          ],
        ),
      ],
    ),

          ),
        ),
        Card(
          child: InkWell(
            splashColor: Colors.redAccent,
            onLongPress: (){},
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.report_problem, color: Colors.redAccent,),
                  title: Text('Atraso entrega - Edital'),
                  subtitle: Text('Projeto XYP - Entregas'),
                ),
                ButtonBar(
                  children: <Widget>[
                    FlatButton(onPressed: null, child: Icon(Icons.edit, color: Colors.greenAccent,),),
                    FlatButton(onPressed: null, child: Icon(Icons.share, color: Colors.blueAccent,),),
                    FlatButton(onPressed: null, child: Icon(Icons.delete, color: Colors.redAccent,),)
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
      );
    }
  }
