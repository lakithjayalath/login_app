import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:login_app/screens/common/Home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  bool _validateEmail = false;
  bool _validatePassword = false;

  @override
  void dispose () {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String email = 'lakith@gmail.com';
  String password = 'lakith321';

  showAlertDialog(BuildContext context) {

    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Incorrect details!!!"),
      content: Text("Please re-enter your details"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login'
        ),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: Form(
        child: Center(
          child: Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: MediaQuery
                .of(context)
                .size
                .height - 80,
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 80.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email:',
                      errorText: _validateEmail ? 'Please enter your email' : null,
                    ),
                    // validator: (value) {
                    //   if (value.isEmpty) {
                    //     return 'Please enter your email';
                    //   }
                    //   return null;
                    // },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      errorText: _validatePassword ? 'Please enter your password' : null,
                    ),
                    obscureText: true,
                    // validator: (value) {
                    //   if (value.isEmpty) {
                    //     return 'Please enter your password';
                    //   }
                    //   return null;
                    // },
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: RaisedButton(
                    child: const Text(
                      'Log In',
                      style: TextStyle(color: Colors.white, fontFamily: 'IndieFlower', fontSize: 32.0),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                      side: BorderSide(color: Colors.red[600]),
                    ),
                    color: Colors.red[600],
                    onPressed: () {
                      setState(() {
                        _emailController.text.isEmpty ? _validateEmail = true : _validateEmail = false;
                        _passwordController.text.isEmpty ? _validatePassword = true : _validatePassword = false;
                      });
                      if (_emailController.text == email && _passwordController.text == password) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Home()
                            )
                        );
                        _emailController.clear();
                        _passwordController.clear();
                      }
                      else {
                        showAlertDialog(context);
                        _emailController.clear();
                        _passwordController.clear();
                      }
                    },
                  ),
                ),
                Divider(
                  color: Colors.blueGrey,
                  height: 40.0,
                ),
                Center(
                  child: Text(
                    'Or log in using social media',
                    style: TextStyle(color: Colors.black87, fontFamily: 'IndieFlower', fontSize: 24.0),
                  ),
                ),
                Image.asset('assets/topright.png'),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


