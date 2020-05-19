import 'package:flutter/material.dart';
import 'package:teamz/ViewNewTodo.dart';

class MyToDo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyReorderableTaskList(),
      floatingActionButton: MyFloatingActionButtonNewTodo(),
    );
  }
}

//Reorderable list elements
//FloatingActionButton
class MyFloatingActionButtonNewTodo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      tooltip: 'Idea',
      onPressed: ()=>{ Navigator.push(context, MaterialPageRoute(builder: (context) => MyNewTodo())) },
    );
  }
}

class MyTask{
  String task;
  MyTask(this.task);
}
//ReorderableListView  implementation

class MyReorderableTaskList extends StatefulWidget {
  @override
  _MyReorderableTaskListState createState() => _MyReorderableTaskListState();
}

class _MyReorderableTaskListState extends State<MyReorderableTaskList> {
  List<String> tasks = [];
  MyTask t =  MyTask("");

  void initState(){
    tasks = [ t.task = 'Buy ice cream', t.task = 'Learn Flutter', t.task = 'Read books' ];
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