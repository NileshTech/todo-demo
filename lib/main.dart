import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_demo/loading.dart';
import 'package:todo_demo/view/todo_list.dart';
import 'package:todo_demo/view/intro_screen.dart';
import 'package:todo_demo/view/user_on_boarding.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text(snapshot.error.toString())),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
        child: CircularProgressIndicator(),
      );
        }
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: TodoIntroScreen(),
          theme: ThemeData(
            // scaffoldBackgroundColor: Colors.grey[900],
            primarySwatch: Colors.indigo,
          ),
        );
      },
    );
  }
}
