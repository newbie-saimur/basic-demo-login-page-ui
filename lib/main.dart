import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/loginpage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple, useMaterial3: false),
      darkTheme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: false,
      ),
      title: "My First App",
      color: Colors.deepPurple,
      home: LoginPage(),
    );
  }
}
