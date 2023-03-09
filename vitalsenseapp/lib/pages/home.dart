import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:vitalsenseapp/card/heartrate.dart';
import 'package:vitalsenseapp/card/spo2.dart';
import 'package:vitalsenseapp/card/bodytemp.dart';
import 'package:vitalsenseapp/function/changecolorfunc.dart';

// var colorlist = [
//   Color.fromRGBO(152, 201, 122, 1),
//   Color.fromRGBO(252, 200, 66, 1),
//   Color.fromRGBO(241, 66, 57, 1),
// ];

// Color changeColor(int value) {
//   int color = 0;
//   if (value >= 12 && value <= 20) {
//     color = 0;
//   } else if ((value >= 9 && value <= 11) || (value >= 21 && value <= 24)) {
//     color = 1;
//   } else if (value <= 8 || value >= 25) {
//     color = 2;
//   }
//   return colorlist[color];
// }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dbRef = FirebaseDatabase.instance.ref().child('Sensor');
  final databaseReference = FirebaseDatabase.instance.ref();

  String displayrr = '0';

  @override
  void initState() {
    _activatelistenerrr();
    super.initState();
  }

  void _activatelistenerrr() {
    databaseReference.child('Sensor/rr/data').onValue.listen((event) {
      final rrtempdata = event.snapshot.value;
      setState(() {
        displayrr = '$rrtempdata';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
              // mainAxisAlignment: ,
              children: [Text("data")]),
          Container(
              margin: const EdgeInsets.only(bottom: 35.0),
              width: 214,
              height: 214,
              child: Stack(children: <Widget>[
                Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                        width: 214,
                        height: 214,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.25),
                                offset: Offset(0, 4),
                                blurRadius: 4)
                          ],
                          // color: Color.fromRGBO(136, 194, 80, 1),
                          color: changeColor(
                              'Respiratory Rate', int.parse(displayrr)),
                          border: Border.all(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            width: 3,
                          ),
                          borderRadius: const BorderRadius.all(
                              Radius.elliptical(214, 214)),
                        ))),
                Positioned(
                    top: 25,
                    left: 25,
                    child: Container(
                        width: 163,
                        height: 163,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(255, 249, 243, 1),
                          border: Border.all(
                            color: const Color.fromRGBO(0, 0, 0, 1),
                            width: 3,
                          ),
                          borderRadius: const BorderRadius.all(
                              Radius.elliptical(163, 163)),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/lung.png'),
                              Text(
                                displayrr,
                                style: const TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontFamily: 'Inter',
                                    fontSize: 70,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                'BPM',
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontFamily: 'Inter',
                                    fontSize: 20,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal),
                              )
                            ],
                          ),
                        ))),
              ])),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [bodytempCard(), spo2Card(), homeCard()],
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [DrawerHeader(child: Text("data"))],
        ),
      ),
    );
  }
}
