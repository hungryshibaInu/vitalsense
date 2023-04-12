import 'dart:math';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vitalsenseapp/function/checkconditionfunc.dart';
import 'model/firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';
import 'pages/login.dart';
import 'pages/home.dart';
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
  runApp(MyAppWrapper());
}

class MyAppWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MyApp();
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<void> _showNotification(
      int id, String level, String type, int value) async {
    // const AndroidNotificationDetails androidNotificationDetails =
    //     AndroidNotificationDetails(
    //   'channel_id',
    //   'Channel Name',
    //   channelDescription: 'Channel Description',
    //   importance: Importance.high,
    //   priority: Priority.high,
    // );
    const DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails();

    const NotificationDetails plaformChannelDetails = NotificationDetails(
        // android: androidNotificationDetails,
        iOS: darwinNotificationDetails);

    await flutterLocalNotificationsPlugin.show(
        id, level, 'Your $type is $value', plaformChannelDetails);
  }

  // final dbRef = FirebaseDatabase.instance.ref().child('Sensor');
  // final databaseReference = FirebaseDatabase.instance.ref();
  final databaseReference = FirebaseDatabase.instance.ref();

  @override
  void initState() {
    _activatelistenerrr();
    super.initState();
  }

  void _activatelistenerrr() {
    //check RR
    databaseReference.child('Sensor/rr/data').onValue.listen((event) {
      final tempdata = event.snapshot.value;
      int uniqueId = Random().nextInt(100000);
      String condition =
          checkcondition('Respiratory Rate', int.parse('$tempdata'));

      if (condition == 'Warning') {
        _showNotification(uniqueId, '$condition🟡', 'Respiratory Rate',
            int.parse('$tempdata'));
      } else if (condition == 'Danger') {
        _showNotification(uniqueId, '$condition🔴', 'Respiratory Rate',
            int.parse('$tempdata'));
      }
    });

    //check HR
    databaseReference.child('Sensor/hr/data').onValue.listen((event) {
      final tempdata = event.snapshot.value;
      int uniqueId = Random().nextInt(100000);
      String condition = checkcondition('Heart Rate', int.parse('$tempdata'));

      if (condition == 'Warning') {
        _showNotification(
            uniqueId, '$condition🟡', 'Heart Rate', int.parse('$tempdata'));
      } else if (condition == 'Danger') {
        _showNotification(
            uniqueId, '$condition🔴', 'Heart Rate', int.parse('$tempdata'));
      }
    });

    //check SpO2
    databaseReference.child('Sensor/spo2/data').onValue.listen((event) {
      final tempdata = event.snapshot.value;
      int uniqueId = Random().nextInt(100000);
      String condition = checkcondition('SpO2', int.parse('$tempdata'));

      if (condition == 'Warning') {
        _showNotification(
            uniqueId, '$condition🟡', 'SpO2', int.parse('$tempdata'));
      } else if (condition == 'Danger') {
        _showNotification(
            uniqueId, '$condition🔴', 'SpO2', int.parse('$tempdata'));
      }
    });

    //check Skin Temperature
    databaseReference.child('Sensor/bodytemp/data').onValue.listen((event) {
      final tempdata = event.snapshot.value;
      int uniqueId = Random().nextInt(100000);
      String condition =
          checkcondition('Skin Temperature', int.parse('$tempdata'));

      if (condition == 'Warning') {
        _showNotification(uniqueId, '$condition🟡', 'Skin Temperature',
            int.parse('$tempdata'));
      } else if (condition == 'Danger') {
        _showNotification(uniqueId, '$condition🔴', 'Skin Temperature',
            int.parse('$tempdata'));
      }
    });
  }

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




// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'VitalSense',
//       theme: ThemeData(
//         appBarTheme: const AppBarTheme().copyWith(
//           backgroundColor: const Color(0xFFFFF9F3),
//         ),
//         scaffoldBackgroundColor: const Color(0xFFFFF9F3),
//       ),
//       routes: {
//         '/home': (context) => const HomePage(),
//         '/history': (context) => const HistoryPage(),
//       },
//       // home: const Login(),
//       home: const HomePage(),
//       // home: const HistoryPage(),
//     );
//   }
// }
