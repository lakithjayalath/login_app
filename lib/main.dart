import 'package:flutter/material.dart';
import 'package:login_app/screens/authentication/SignIn.dart';
import 'package:login_app/screens/authentication/SignUp.dart';
import 'package:login_app/screens/authentication/Login.dart';

void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                radius: 180.0,
                backgroundImage: AssetImage('assets/ninja.jpg'),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: RaisedButton(
                child: const Text(
                  'Get Started',
                  style: TextStyle(color: Colors.white, fontFamily: 'IndieFlower', fontSize: 32.0),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                  side: BorderSide(color: Colors.red[600]),
                ),
                color: Colors.red[600],
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUp()
                    )
                  );
                },
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Center(
              child: FlatButton(
                textColor: Colors.black,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignIn()
                      )
                  );
                },
                child: Text(
                  "Already have an account? Log In"
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

