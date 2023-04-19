import 'dart:math';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vitalsenseapp/function/checkconditionfunc.dart';
import 'package:vitalsenseapp/pages/notification.dart';
import 'model/firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';
import 'pages/login.dart';
import 'pages/home.dart';
import 'pages/register.dart';
import 'pages/history.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

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
  // runApp(MyAppWrapper());
  runApp(
    ChangeNotifierProvider(
      create: (context) => MyModel(),
      child: MyAppWrapper(),
    ),
  );
}

class MyModel extends ChangeNotifier {
  String _myVariable = '';

  String get myVariable => _myVariable;

  set myVariable(String value) {
    _myVariable = value;
    notifyListeners();
  }
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
  late final MyModel myModel;

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

  // void addToNotiList(String _type, String _text, String _time) {
  //   NotiPage notiPage = NotiPage();
  //   notiPage.addNotiList(_type, _text, _time);
  //   // setState(() {
  //   //   // notiList.add(Notification(type: _type, text: _text, time: _time));
  //   // });
  // }
  // final GlobalKey<_NotiPageState> notiPageKey = GlobalKey();
  // final _NotiPageState notiPageState = notiPageKey.currentState;

  @override
  void initState() {
    _activatelistener();
    super.initState();
    myModel = Provider.of<MyModel>(context, listen: false);
  }

  void _activatelistener() {
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
      myModel._myVariable =
          'last updated at ${DateTime.now().toString().substring(0, 19)}';
      // print('rr: $condition');
    });

    // check HR
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
      myModel._myVariable =
          'last updated et ${DateTime.now().toString().substring(0, 19)}';
      // print('hr: $condition');
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
      myModel._myVariable =
          'last updated at ${DateTime.now().toString().substring(0, 19)}';
      // print(condition);
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
      myModel._myVariable =
          'last updated at ${DateTime.now().toString().substring(0, 19)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    // final myModel = Provider.of<MyModel>(context);
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
      home: const HomePage(),
      // home: const HistoryPage(),
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
