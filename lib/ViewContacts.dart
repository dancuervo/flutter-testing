import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class Contact{
  //id is a unique number created with new contact
  String id, name, surname, email, mobile, image, expertise;
  Contact({this.id, this.name, this.surname, this.email, this.mobile, this.image, this.expertise});
}

class MyContacts extends StatefulWidget {
  @override
  _MyContactsState createState() => _MyContactsState();
}

class _MyContactsState extends State<MyContacts> {
  List<Contact> contacts;
  int index = 0;
  void initState(){
    contacts = [
      Contact(id: '345', name: 'Pepe', mobile: '332335444'),
      Contact(id:'216'),
      Contact(id:'1245', expertise: 'Tradução'),
      Contact(id:'35'),
    ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index){
            return Card(
              child: InkWell(
                splashColor: Colors.blue,
                onLongPress: ()=>{},
                child: ListTile(
                    title: Text(contacts[index].name != null ? contacts[index].name : 'Nome'),
                    subtitle: Text(contacts[index].expertise != null ? contacts[index].expertise : 'expertise'),
                    leading: Icon(Icons.person_pin),
                  trailing: Icon(Icons.contacts, color: Colors.amber,),
                  ),
              ),
            );
          },
        ),
      floatingActionButton: SpeedDial(
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
            child: Icon(Icons.person_add),
            backgroundColor: Colors.redAccent,
            label: 'Criar novo Contato',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () => print('FIRST CHILD')
        ),
        SpeedDialChild(
          child: Icon(Icons.get_app),
          backgroundColor: Colors.blue,
          label: 'Importar',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => print('SECOND CHILD'),
        ),
        SpeedDialChild(
          child: Icon(Icons.autorenew),
          backgroundColor: Colors.green,
          label: 'Update',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => print('THIRD CHILD'),
        ),
      ],
    ),
    );
  }
}
//Speed Dial
//https://pub.dev/packages/flutter_speed_dial#-installing-tab-

