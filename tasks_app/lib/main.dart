import 'package:flutter/material.dart';
import 'package:tasks_app/screens/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: ThemeData(
        backgroundColor: Colors.purpleAccent,
        primarySwatch: Colors.purple,
      ),
      home: const Home(),
    );
  }
}

