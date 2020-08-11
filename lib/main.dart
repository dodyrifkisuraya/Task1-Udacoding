import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.amber
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task1',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.amber,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        '/login' : (BuildContext context) => LoginPage(),
        '/register' : (BuildContext context) => RegisterPage(),
      },
    );
  }
}

class LoginPage extends StatelessWidget {
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
                    "Silahkan masukkan email/nomor telepon dan password yang terdaftar. ",
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
                      decoration: InputDecoration(
                          hintText: "Email/Nomer Telepon",
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
                    onPressed: () {},
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
              ],
            )));
  }
}

class RegisterPage extends StatelessWidget {
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
                    "Daftar Akun",
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
                    "Silahkan lengkapi form untuk mendaftar akun. ",
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
                      decoration: InputDecoration(
                          hintText: "Email/Nomer Telepon",
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
                      decoration: InputDecoration(
                          hintText: "Password", border: InputBorder.none),
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
                      decoration: InputDecoration(
                          hintText: "Re-Password", border: InputBorder.none),
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
                      'Daftar',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () {},
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Sudah punya akun? Masuk aja ",
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
                      'Masuk Sekarang',
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
