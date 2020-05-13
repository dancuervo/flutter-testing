import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyScaffold(),
    );
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My ToDoS do orientado a bobjeto'),
      ),
      body: MyReorderableTaskList(),
      floatingActionButton: MyFloatingActionButton() ,
    );
  }
}

//HOME Scree controller

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Container();
  }
}


//FloatingActionButton
class MyFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      tooltip: 'Tive uma ideia',
      onPressed: ()=>{ },
    );
  }
}

class MyTask{
  String task;
  MyTask(this.task);
}
//ReorderableListView  implementation

//https://api.flutter.dev/flutter/material/ReorderableListView-class.html
class MyReorderableTaskList extends StatefulWidget {
  @override
  _MyReorderableTaskListState createState() => _MyReorderableTaskListState();
}

class _MyReorderableTaskListState extends State<MyReorderableTaskList> {
  List<String> tasks = [];
  MyTask t;

  void initState(){
    tasks = [ t.task = 'Comparar Helados', t.task = 'Aprender Algo', t.task = 'Leer esas mierdas que compro' ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return ReorderableListView(
        onReorder: _onReorder,
        children: List.generate(
            tasks.length,
              (index){ return MyListView(index, Key('$index'), tasks ); }
              ),
          );
  }
  void _onReorder(int oldIndex, int newIndex){
    setState(() {
        if(newIndex > oldIndex) { newIndex -= 1; }
        final String item = tasks.removeAt(oldIndex);
        tasks.insert(newIndex, item);
    });
  }
}

class MyListView extends StatefulWidget {
  final int index;
  final Key key;
  final List<String> listTasks;
  MyListView(this.index, this.key, this.listTasks);
  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  @override
  Widget build(BuildContext context) {
    return Card(
         margin: EdgeInsets.all(6),
          child: InkWell(
            splashColor: Colors.blue,
            onTap: ()=>{ MaterialState.focused },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  title: Text('Tarea: ${widget.listTasks[widget.index]} | ${widget.index}',),
                ),
              ],
            ),
          ),
        );
      }
}

/*
https://webcache.googleusercontent.com/search?q=cache:TemHuRX4G0cJ:https://www.flutterbrasil.com/read-blog/23_3-2-orienta%25C3%25A7%25C3%25A3o-%25C3%25A0-objetos-em-dart-construtores.html+&cd=2&hl=en&ct=clnk&gl=br&client=firefox-b-d
https://api.dart.dev/stable/2.8.2/dart-core/List-class.html
https://www.tutorialspoint.com/dart_programming/dart_programming_inserting_elements_into_list.htm
 */