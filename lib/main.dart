import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:task_one/task1/LoginPage.dart';
// import 'package:task_one/task1/RegisterPage.dart';
import 'package:task_one/task2/LoginPage.dart';
import 'package:task_one/task2/HomePage.dart';

void main() {
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   statusBarColor: Colors.amber
  // ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task2',
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
      ),
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        '/login' : (BuildContext context) => LoginPage(),
        '/home' : (BuildContext context) => HomePage(LoginPage().createState().usernameController.text, LoginPage().createState().passwordController.text),
      },
    );
  }
}
