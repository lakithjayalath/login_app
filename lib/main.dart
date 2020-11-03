import 'package:flutter/material.dart';
import 'package:login_app/screens/Wrapper.dart';
import 'package:login_app/screens/authentication/SignIn.dart';
import 'package:login_app/screens/authentication/SignUp.dart';
import 'package:login_app/screens/authentication/Login.dart';
import 'package:login_app/screens/services/auth.dart';
import 'package:provider/provider.dart';

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
    return StreamProvider.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}

