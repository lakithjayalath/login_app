import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text(
          'Welcome back, Lakith'
        ),
        backgroundColor: Colors.grey[850],
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 60.0,
          ),
          Center(
            child: CircleAvatar(
              radius: 40.0,
              backgroundImage: AssetImage('assets/ninja-mascot-ninja.jpg'),
            ),
          ),
          Divider(
            color: Colors.grey[800],
            height: 60.0,
          ),
          Text(
            'NAME',
            style: TextStyle(
              color: Colors.teal,
              letterSpacing: 2.0
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'Lakith Jayalath',
            style: TextStyle(
              color: Colors.cyanAccent,
              fontWeight: FontWeight.bold,
              fontSize: 28.0,
              letterSpacing: 2.0
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            'EMAIL',
            style: TextStyle(
                color: Colors.teal,
                letterSpacing: 2.0
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'lakith@gmail.com',
            style: TextStyle(
                color: Colors.cyanAccent,
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
                letterSpacing: 2.0
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
        ],
      ),
    );
  }
}
