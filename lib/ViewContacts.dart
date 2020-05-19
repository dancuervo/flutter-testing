import 'package:flutter/material.dart';

class Contact{
  //id is a unique number created with new contact
  String id, name, surname, email, mobile, image;
  Contact( this.id ,[ this.name, this.surname, this.email, this.mobile, this.image ]);
}

class MyContacts extends StatefulWidget {
  @override
  _MyContactsState createState() => _MyContactsState();
}

class _MyContactsState extends State<MyContacts> {
  List<Contact> contacts;

  void initState(){
    contacts = [
      Contact('213'),
      Contact('1245', 'Juanjo'),
      Contact('35'),
    ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    int index = contacts.length;
    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index){
            return ListTile(
              title: Text(contacts[index].id),
              subtitle: Text(contacts[index].name != null ? contacts[index].name : 'Subtítulo'),
              leading: Icon(Icons.person),
            );
          },
        ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.person_add),
          onPressed: null
      ),
    );
  }
}

