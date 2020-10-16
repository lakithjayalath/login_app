import 'package:flutter/material.dart';
import 'package:login_app/screens/common/ThankYou.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  TextEditingController _fullNameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  bool _validateFullName = false;
  bool _validateEmail = false;
  bool _validatePassword = false;

  @override
  void dispose () {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: Container(
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
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Full Name:',
                  errorText: _validateFullName ? 'Please enter your full name' : null,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  errorText: _validateEmail ? 'Please enter your email' : null,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  errorText: _validatePassword ? 'Please enter your password' : null,
                ),
                obscureText: true,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: RaisedButton(
                child: const Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.white, fontFamily: 'IndieFlower', fontSize: 32.0),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                  side: BorderSide(color: Colors.red[600]),
                ),
                color: Colors.red[600],
                onPressed: () {
                  // setState(() {
                  //   _fullNameController.text.isEmpty ? _validateFullName = true : _validateFullName = false;
                  //   _emailController.text.isEmpty ? _validateEmail = true : _validateEmail = false;
                  //   _passwordController.text.isEmpty ? _validatePassword = true : _validatePassword = false;
                  // });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ThankYou()
                        )
                    );
                    _fullNameController.clear();
                    _emailController.clear();
                    _passwordController.clear();
                },
              ),
            ),
            Divider(
              color: Colors.blueGrey,
              height: 20.0,
            ),
            Center(
              child: Text(
                'Or create account using social media',
                style: TextStyle(color: Colors.black87, fontFamily: 'IndieFlower', fontSize: 24.0),
              ),
            ),
            Image.asset('assets/topright.png')
          ],
        ),
      ),
    );
  }
}
