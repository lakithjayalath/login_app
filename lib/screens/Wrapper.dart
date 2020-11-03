import 'package:flutter/material.dart';
import 'package:login_app/models/user.dart';
import 'package:login_app/screens/authentication/Authentication.dart';
import 'package:provider/provider.dart';
import 'package:login_app/screens/common/Home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    if (user == null) {
      return Authentication();
    } else {
      return Home();
    }
  }
}
