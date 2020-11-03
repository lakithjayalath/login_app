import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location_permissions/location_permissions.dart';
import 'package:login_app/screens/services/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final AuthService _auth = AuthService();

  Position _currentPosition;

  _getCurrentLocation () {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
          setState(() {
            _currentPosition = position;
          });
    }).catchError((e) {
      print(e);
    });
  }

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
        actions: [
          FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.person, color: Colors.white,),
              label: Text('logout', style: TextStyle(color: Colors.white),))
        ],
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
          Text(
            'LOCATION',
            style: TextStyle(
                color: Colors.teal,
                letterSpacing: 2.0
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          if(_currentPosition != null)
            Text(
              'LAT: ${_currentPosition.latitude}, LNG: ${_currentPosition.longitude}',
              style: TextStyle(
                color: Colors.cyanAccent,
                letterSpacing: 2.0
              ),
            ),
          FlatButton(
            child: Text(
              'Get Location'
            ),
            color: Colors.cyanAccent,
            onPressed: () {
              _getCurrentLocation();
            },
          )
        ],
      ),
    );
  }
}

