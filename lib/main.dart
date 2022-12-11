import 'package:flutter/material.dart';
import 'package:signup/screens/signupscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      title: 'SignUp Form',
      home: SignUpPage(title: 'SignUp Form'),
      debugShowCheckedModeBanner: false,
    );
  }
}
