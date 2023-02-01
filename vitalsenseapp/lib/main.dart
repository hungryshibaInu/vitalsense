import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'model/firebase_options.dart';
import 'pages/login.dart';
import 'pages/home.dart';
import 'pages/test.dart';
import 'pages/register.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: Login(),
    );
  }
}
