import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:vitalsenseapp/card/heartrate.dart';
// import 'package:vitalsenseapp/pages/history.dart';
import 'model/firebase_options.dart';
import 'pages/login.dart';
import 'pages/home.dart';
// import 'pages/test.dart';
import 'pages/register.dart';
import 'pages/history.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const DarwinInitializationSettings initializationSettingsIOS =
      DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

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
      title: 'VitalSense',
      theme: ThemeData(
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: const Color(0xFFFFF9F3),
        ),
        scaffoldBackgroundColor: const Color(0xFFFFF9F3),
      ),
      routes: {
        '/home': (context) => const HomePage(),
        '/history': (context) => const HistoryPage(),
      },
      // home: const Login(),
      // home: const HomePage(),
      home: const HistoryPage(),
    );
  }
}
