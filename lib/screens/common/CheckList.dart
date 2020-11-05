import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login_app/screens/services/auth.dart';

class List extends StatefulWidget {
  @override
  _ListState createState() => _ListState();
}

class _ListState extends State<List> {

  final AuthService _auth = AuthService();

  String name;
  String contactNo;
  String type;
  String home;

  getName(name) {
    this.name = name;
  }

  getContactNo(contactNo) {
    this.contactNo = contactNo;
  }

  getType(type) {
    this.type = type;
  }

  getHome(home) {
    this.home = home;
  }

  createData() {
    DocumentReference documentReference = Firestore.instance.collection('MyContacts').document(name);

    Map<String, dynamic> contacts = {
      "name": name,
      "contactNo": contactNo,
      "type": type,
      "home": home
    };

    documentReference.setData(contacts).whenComplete(() => print("$name created"));

  }

  readData() {

    DocumentReference documentReference = Firestore.instance.collection('MyContacts').document(name);

    documentReference.get().then((dataSnapShot) {
      print(dataSnapShot.data['name']);
      print(dataSnapShot.data['contactNo']);
      print(dataSnapShot.data['type']);
      print(dataSnapShot.data['home']);
    });
  }

  updateData() {
    DocumentReference documentReference = Firestore.instance.collection('MyContacts').document(name);

    Map<String, dynamic> contacts = {
      "name": name,
      "contactNo": contactNo,
      "type": type,
      "home": home
    };

    documentReference.setData(contacts).whenComplete(() => print("$name updated"));
  }

  deleteData() {
    DocumentReference documentReference = Firestore.instance.collection('MyContacts').document(name);

    documentReference.delete().whenComplete(() => print('$name deleted'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contacts',
          style: TextStyle(
            color: Colors.black
          ),
        ),
        backgroundColor: Colors.tealAccent,
        elevation: 0.0,
        actions: [
          FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.person),
              label: Text('logout')
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Name",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2.0
                      )
                  )
                ),
                onChanged: (String name) {
                  getName(name);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Contact No",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2.0
                        )
                    )
                ),
                onChanged: (String contactNo) {
                    getContactNo(contactNo);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Type",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2.0
                        )
                    )
                ),
                onChanged: (String type) {
                  getType(type);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Home",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2.0
                        )
                    )
                ),
                onChanged: (String home) {
                  getHome(home);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  color: Colors.lightGreenAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)
                    ),
                    child: Text("create"),
                    textColor: Colors.white,
                    onPressed: () {
                      createData();
                    }
                ),
                RaisedButton(
                    color: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)
                    ),
                    child: Text("read"),
                    textColor: Colors.white,
                    onPressed: () {
                      readData();
                    }
                ),
                RaisedButton(
                    color: Colors.orangeAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)
                    ),
                    child: Text("update"),
                    textColor: Colors.white,
                    onPressed: () {
                      updateData();
                    }
                ),
                RaisedButton(
                    color: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)
                    ),
                    child: Text("delete"),
                    textColor: Colors.white,
                    onPressed: () {
                      deleteData();
                    }
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  textDirection: TextDirection.ltr,
                  children: [
                    Expanded(
                        child: Text('Name',)
                    ),
                    Expanded(
                        child: Text('Contact No')
                    ),
                    Expanded(
                        child: Text('Type')
                    ),
                    Expanded(
                        child: Text('Home')
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              StreamBuilder(
                stream: Firestore.instance.collection('MyContacts').snapshots(),
                builder: (context, snapshot) {
                  if(snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot documentSnapshot = snapshot.data.documents[index];
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                  child: Text(documentSnapshot["name"]),
                              ),
                              Expanded(
                                child: Text(documentSnapshot["contactNo"]),
                              ),
                              Expanded(
                                child: Text(documentSnapshot["type"]),
                              ),
                              Expanded(
                                child: Text(documentSnapshot["home"]),
                              ),
                            ],
                          );
                        }
                    );
                  } else {
                    return Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: CircularProgressIndicator(),
                    );
                  }
                }
            )
          ],
        ),
      ),
    );
  }
}
