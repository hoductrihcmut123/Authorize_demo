

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../loginpage.dart';
import '../dashboard.dart';
import '../adminonly.dart';

class UserManagement {
  

  Widget handleAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return DashboardPage();
        }
        return LoginPage();
      },
    );
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }

  authorizeAdmin(BuildContext context) {
    FirebaseAuth.instance.userChanges().listen((user) {
      if(user!=null)
      {
      FirebaseFirestore.instance
          .collection('users')
          .where('uid', isEqualTo: user.uid)
          .get()
          .then((docs) {
        if (docs.docs[0].exists) {
          if (docs.docs[0].data()['role'] == 'admin') {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => AdminPage()));
          } else {
            print('Not Authorized');
          }
        }
          
      });
    }
    });
  }
}
