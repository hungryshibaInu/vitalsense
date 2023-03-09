import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:vitalsenseapp/function/changecolorfunc.dart';

// var colorlist = [
//   const Color.fromRGBO(152, 201, 122, 1),
//   const Color.fromRGBO(252, 200, 66, 1),
//   const Color.fromRGBO(241, 66, 57, 1),
// ];

// Color changeColor(int value) {
//   int color = 0;
//   if (value >= 51 && value <= 90) {
//     color = 0;
//   } else if ((value >= 91 && value <= 130) || (value >= 41 && value <= 50)) {
//     color = 1;
//   } else if (value <= 40 || value <= 131) {
//     color = 2;
//   }
//   return colorlist[color];
// }

class homeCard extends StatefulWidget {
  const homeCard({super.key});

  @override
  State<homeCard> createState() => _homeCardState();
}

class _homeCardState extends State<homeCard> {
  final dbRef = FirebaseDatabase.instance.ref().child('Sensor');
  final databaseReference = FirebaseDatabase.instance.ref();

  String displayhr = '0';

  @override
  void initState() {
    _activatelistenerhr();
    super.initState();
  }

  void _activatelistenerhr() {
    databaseReference.child('Sensor/hr/data').onValue.listen((event) {
      final spo2data = event.snapshot.value;
      setState(() {
        displayhr = '$spo2data';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10.0),
        width: 93,
        height: 156,
        child: Stack(children: <Widget>[
          Positioned(
              top: 0,
              left: 0,
              child: SizedBox(
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
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                  offset: Offset(0, 4),
                                  blurRadius: 4)
                            ],
                            // color: Color.fromRGBO(252, 200, 66, 1),
                            color:
                                changeColor('Heart Rate', int.parse(displayhr)),
                            border: Border.all(
                              color: const Color.fromRGBO(0, 0, 0, 1),
                              width: 2,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(254, 248, 242, 1),
                                  border: Border.all(
                                    color: const Color.fromRGBO(0, 0, 0, 1),
                                    width: 2,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.elliptical(60, 60)),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    displayhr,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                      fontFamily: 'Inter',
                                      fontSize: 30,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              const Text(
                                'BPM',
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
                              color: const Color.fromRGBO(255, 249, 243, 1),
                              border: Border.all(
                                color: const Color.fromRGBO(0, 0, 0, 1),
                                width: 2,
                              ),
                              borderRadius: const BorderRadius.all(
                                  Radius.elliptical(29, 29)),
                            ),
                            child: Image.asset('assets/images/hricon.png')))
                  ]))),
        ]));
  }
}
