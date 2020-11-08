import 'package:flutter/material.dart';
import 'package:login_app/screens/services/auth.dart';
import 'package:login_app/shared/constants.dart';
import 'package:login_app/shared/loading.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String error = "";

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.tealAccent,
        elevation: 0.0,
        title: Text(
            'Sign up',
            style: TextStyle(
              color: Colors.black
            ),
        ),
        actions: [
          FlatButton.icon(
              onPressed: () {
                widget.toggleView();
              },
              icon: Icon(Icons.person),
              label: Text('Sign in')
          )
        ],
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                obscureText: true,
                validator: (val) => val.length < 6 ? 'Enter the password 6+ chars long' : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                onPressed: () async {
                  setState(() => loading = true);
                  if(_formKey.currentState.validate()) {
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                    if(result == null) {
                      setState(() {
                        error = 'please supply a valid email';
                        loading = false;
                      });
                    }
                  }
                },
                color: Colors.pink[400],
                child: Text(
                  'Register',
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
              SizedBox(height: 12.0,),
              Text(
                error,
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 14.0
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
