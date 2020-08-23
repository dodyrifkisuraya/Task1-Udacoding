import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  String uname, pass;
// wajib diisi
  HomePage(this.uname, this.pass);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
        ),
        body: Container(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Column(
              children: <Widget>[
                Text("Username : $uname"),
                Text("Pass : $pass"),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 16, 0, 16),
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(width: 2, color: Colors.amber)),
                  child: FlatButton(
                    child: Text(
                      'Logout',
                      style: TextStyle(color: Colors.amber, fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                  ),
                ),
              ],
            )));
  }
}
