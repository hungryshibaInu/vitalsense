import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:vitalsenseapp/card/heartrate.dart';
import 'package:vitalsenseapp/card/spo2.dart';
import 'package:vitalsenseapp/card/bodytemp.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dbRef = FirebaseDatabase.instance.ref().child('Sensor');
  final databaseReference = FirebaseDatabase.instance.ref();

  String displayrr = 'deeja';

  @override
  void initState() {
    _activatelistenertemp();
    super.initState();
  }

  void _activatelistenertemp() {
    databaseReference
        .child('Sensor/rr/data')
        .onValue
        .listen((event) {
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
          Container(
              margin: EdgeInsets.only(bottom: 35.0),
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
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.25),
                                offset: Offset(0, 4),
                                blurRadius: 4)
                          ],
                          color: Color.fromRGBO(136, 194, 80, 1),
                          border: Border.all(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            width: 3,
                          ),
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(214, 214)),
                        ))),
                Positioned(
                    top: 25,
                    left: 25,
                    child: Container(
                        width: 163,
                        height: 163,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 249, 243, 1),
                          border: Border.all(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            width: 3,
                          ),
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(163, 163)),
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
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontFamily: 'Inter',
                                    fontSize: 70,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
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
            children: const [bodytempCard(),spo2Card(),homeCard()],
          )
        ],
      ),
    );
  }
}
