import 'package:flutter/material.dart';
import 'login.dart';
import 'home.dart';
import 'test.dart';
import 'register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: Color(0xFFFFF9F3),
        ),
        scaffoldBackgroundColor: Color(0xFFFFF9F3),
      ),
      // home: const Login(),
      home: RegisterForm(),
    );
  }
}
