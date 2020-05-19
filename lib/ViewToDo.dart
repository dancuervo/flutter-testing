import 'package:flutter/material.dart';
import 'package:teamz/ViewNewTodo.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class MyToDo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyReorderableTaskList(),
      floatingActionButton: MySpeedDial(),
    );
  }
}

class MySpeedDial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpeedDial(
    // both default to 16
    marginRight: 18,
    marginBottom: 20,
    animatedIcon: AnimatedIcons.menu_close,
    animatedIconTheme: IconThemeData(size: 22.0),
    // this is ignored if animatedIcon is non null
    // child: Icon(Icons.add),
    visible: true, //_dialVisible true exhibe el boton dial
    // If true user is forced to close dial manually
    // by tapping main button and overlay is not rendered.
    closeManually: false,
    curve: Curves.bounceIn,
    overlayColor: Colors.black,
    overlayOpacity: 0.5,
    onOpen: () => print('OPENING DIAL'),
    onClose: () => print('DIAL CLOSED'),
    tooltip: 'Speed Dial',
    heroTag: 'speed-dial-hero-tag',
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    elevation: 8.0,
    shape: CircleBorder(),
    children: [
    SpeedDialChild(
    child: Icon(Icons.lightbulb_outline),
    backgroundColor: Colors.redAccent,
    label: 'Criar nova Tarefa',
    labelStyle: TextStyle(fontSize: 18.0),
    onTap: () => print('FIRST CHILD')
    ),
    SpeedDialChild(
    child: Icon(Icons.add_a_photo),
    backgroundColor: Colors.blue,
    label: 'Foto',
    labelStyle: TextStyle(fontSize: 18.0),
    onTap: () => print('SECOND CHILD'),
    ),
    SpeedDialChild(
    child: Icon(Icons.keyboard_voice),
    backgroundColor: Colors.green,
    label: 'Gravar',
    labelStyle: TextStyle(fontSize: 18.0),
    onTap: () => print('THIRD CHILD'),
    ),
    ],
    );
  }
}


//Reorderable list elements
//FloatingActionButton
class MyFloatingActionButtonNewTodo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.create),
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