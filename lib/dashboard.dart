import 'package:flutter/material.dart';

import './allusers.dart';

import 'services/usermanagement.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  UserManagement userObj = UserManagement();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('Raja'),
                accountEmail: Text('testemail@test.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage('http://i.pravatar.cc/300'),
                ),
              ),
              ListTile(
                title: Text('Allusers Page'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              AllUsersPage()));
                },
              ),
              ListTile(
                title: Text('Admins only'),
                onTap: () {
                  Navigator.of(context).pop();
                  userObj.authorizeAdmin(context);
                },
              ),
              ListTile(
                title: Text('Logout', style: TextStyle(color: Colors.red)),
                onTap: () {
                  Navigator.of(context).pop();
                  userObj.signOut();
                },
              ),
            ],
          ),
        ),
        body: Center(
          child: Text('All Users Dashboard'),
        ));
  }
}
