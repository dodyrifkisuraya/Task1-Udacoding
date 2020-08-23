import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LoginPage extends StatefulWidget{
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String username = "", password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: Container(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text(
                    "Masuk Akun",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  width: 300,
                  child: Text(
                    "Silahkan masukkan username/nomor telepon dan password yang terdaftar. ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[200],
                    ),
                    child: TextFormField(
                      controller: usernameController,
                      decoration: InputDecoration(
                          hintText: "Username/Nomer Telepon",
                          border: InputBorder.none),
                      cursorColor: Colors.amber,
                      style: TextStyle(color: Colors.grey[700]),
                    )),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[200],
                    ),
                    child: TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                          hintText: "Password", border: InputBorder.none),
                      cursorColor: Colors.amber,
                      style: TextStyle(color: Colors.grey[700]),
                    )),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 16, 0, 16),
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.amber,
                  ),
                  child: FlatButton(
                    child: Text(
                      'Masuk',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () {
                      setState((){
                        username = usernameController.text;
                        password = passwordController.text;
                      });
                    },
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Belum punya akun? Daftar dulu ",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ]),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 16, 0, 16),
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(width: 2, color: Colors.amber)),
                  child: FlatButton(
                    child: Text(
                      'Daftar Sekarang',
                      style: TextStyle(color: Colors.amber, fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                  ),
                ),
                Text(username),
                Text(password)
              ],
            )));
  }
}
