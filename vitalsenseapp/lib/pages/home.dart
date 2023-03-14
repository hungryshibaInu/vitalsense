import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:vitalsenseapp/card/heartrate.dart';
import 'package:vitalsenseapp/card/spo2.dart';
import 'package:vitalsenseapp/card/bodytemp.dart';
import 'package:vitalsenseapp/function/changecolorfunc.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

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
      body: SliderDrawer(
        // sliderOpenSize: 2000,
        appBar: const SliderAppBar(
            appBarHeight: 100,
            appBarPadding: EdgeInsets.only(top: 50),
            appBarColor: Colors.white,
            title: Text('',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700))),
        slider: Drawer(
          width: 200,
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 10),
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ListTile(
                    leading: const Icon(
                      Icons.home,
                      color: Colors.amber,
                      size: 30,
                    ),
                    title: const Text(
                      'Home',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    onTap: () =>
                        Navigator.pushReplacementNamed(context, '/home')),
                ListTile(
                  leading: const Icon(
                    Icons.history,
                    color: Colors.amber,
                    size: 30,
                  ),
                  title: const Text(
                    'History',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  onTap: () =>
                      Navigator.pushReplacementNamed(context, '/history'),
                )
              ],
            ),
          ),
        ),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      'assets/images/wall.jpg'), //change bg image here
                  fit: BoxFit.cover)),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Row(
              //     // mainAxisAlignment: ,
              //     children: [Text("data")]),
              Container(
                  margin: const EdgeInsets.only(top: 125, bottom: 35.0),
                  width: 214,
                  height: 214,
                  child: Stack(children: <Widget>[
                    Container(
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
                            color: const Color.fromRGBO(0, 0, 0, 1),
                            width: 3,
                          ),
                          borderRadius: const BorderRadius.all(
                              Radius.elliptical(214, 214)),
                        )),
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
        ),
      ),
    );
  }
}
