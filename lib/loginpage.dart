import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart'; 

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LoginPage'),
        centerTitle: true,
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            FirebaseAuth.instance
                .signInWithEmailAndPassword(
                    email: 'test1@gmail.com', password: 'test123')
                .then((val) {
              print('Logged In');
            });
          },
          elevation: 5.0,
          color: Colors.blue,
          textColor: Colors.white,
          child: Text('Login'),
        ),
      ),
    );
  }
}
