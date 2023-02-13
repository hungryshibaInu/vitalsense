import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';

var colorlist = [
  Color.fromRGBO(152, 201, 122, 1),
  Color.fromRGBO(252, 200, 66, 1),
  Color.fromRGBO(241, 66, 57, 1)
];

Color changeColor(int value) {
  int color = 0;
  if (value >= 96) {
    color = 0;
  } else if (value >= 92 && value <= 95) {
    color = 1;
  } else if (value <= 91) {
    color = 2;
  }
  return colorlist[color];
}

class spo2Card extends StatefulWidget {
  const spo2Card({super.key});

  @override
  State<spo2Card> createState() => _spo2CardState();
}

class _spo2CardState extends State<spo2Card> {
  final dbRef = FirebaseDatabase.instance.ref().child('Sensor');
  final databaseReference = FirebaseDatabase.instance.ref();

  String displayspo2 = '0';

  @override
  void initState() {
    _activatelistenerspo2();
    super.initState();
  }

  void _activatelistenerspo2() {
    databaseReference.child('Sensor/spo2/data').onValue.listen((event) {
      final hrData = event.snapshot.value;
      setState(() {
        displayspo2 = '$hrData';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10.0),
        width: 93,
        height: 156,
        child: Stack(children: <Widget>[
          Positioned(
              top: 0,
              left: 0,
              child: Container(
                  width: 93,
                  height: 156,
                  child: Stack(children: <Widget>[
                    Positioned(
                        top: 14,
                        left: 0,
                        child: Container(
                          width: 93,
                          height: 142,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                  offset: Offset(0, 4),
                                  blurRadius: 4)
                            ],
                            // color: Color.fromRGBO(252, 200, 66, 1),
                            color: changeColor(int.parse(displayspo2)),
                            // if (int.parse(displayspo2)>95) ...[
                            //   color: colorlist[0]
                            // ] else ... [

                            // ]
                            border: Border.all(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              width: 2,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(254, 248, 242, 1),
                                  border: Border.all(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.all(
                                      Radius.elliptical(60, 60)),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    displayspo2,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                      fontFamily: 'Inter',
                                      fontSize: 30,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                '%',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontFamily: 'Inter',
                                    fontSize: 15,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    height: 1.3333333333333333),
                              )
                            ],
                          ),
                        )),
                    Positioned(
                        top: 0,
                        left: 34,
                        child: Container(
                            width: 29,
                            height: 29,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 249, 243, 1),
                              border: Border.all(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                width: 2,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.elliptical(29, 29)),
                            )))
                  ]))),
        ]));
  }
}
