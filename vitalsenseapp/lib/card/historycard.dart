import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vitalsenseapp/function/changecolorfunc.dart';

// var colorlist = [
//   const Color.fromRGBO(152, 201, 122, 1),
//   const Color.fromRGBO(252, 200, 66, 1),
//   const Color.fromRGBO(241, 66, 57, 1),
// ];

Widget getWarnCritCount(String date, String level) {
  return FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
    future: FirebaseFirestore.instance
        .collection('error')
        .where('date', isEqualTo: date)
        .where('level', isEqualTo: level)
        .get(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        // if (snapshot.hasError) {
        //   return Text('Error: ${snapshot.error}');
        // } else {
        int? dataSize = snapshot.data?.size;

        if (level == 'Warning') {
          return Text('$dataSize warning(s), ',
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 12,
              ));
        } else if (level == 'Danger') {
          return Text('$dataSize critical(s)',
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 12,
              ));
        } else {
          return Text('Error');
        }
        // return Text('$dataSize warning(s)');
      } else {
        return Text('Loading...');
      }
    },
  );
}

// Future<String> getWarningCount(String level, String date) async {
//   QuerySnapshot querySnapshot = await FirebaseFirestore.instance
//       .collection('error')
//       .where('date', isEqualTo: date)
//       .where('level', isEqualTo: level)
//       .get();

//   return querySnapshot.size.toString();
// }
// Future<String> getWarnCritCount(String date, String level) async {
//   try {
//     QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
//         .instance
//         .collection('error')
//         .where('date', isEqualTo: date)
//         .where('level', isEqualTo: level)
//         .get();
//     int dataSize = snapshot.size;
//     return '$dataSize';
//   } catch (e) {
//     return 'Error: $e';
//   }
// }

class HistoryCard extends StatelessWidget {
  final String date;
  final String warncount;
  final String critcount;
  final String hrvalue;
  final String spo2value;
  final String rrvalue;
  final String skintempvalue;
  final String level;

  const HistoryCard(
      {super.key,
      this.date = 'dd/mm/yyyy',
      this.warncount = '0',
      this.critcount = '0',
      this.hrvalue = '0',
      this.rrvalue = '0',
      this.skintempvalue = '0',
      this.spo2value = '0',
      required this.level});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: 313,
      height: 164,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(40)),
        boxShadow: const [
          BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              offset: Offset(0, 4),
              blurRadius: 4)
        ],
        color: const Color.fromRGBO(255, 249, 243, 1),
        border: Border.all(
          color: const Color.fromRGBO(0, 0, 0, 1),
          width: 3,
        ),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 28, right: 28, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    getWarnCritCount(date, 'Warning'),
                    getWarnCritCount(date, 'Danger'),
                  ],
                ),

                // Row(
                //   children: [
                //     FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
                //       future: FirebaseFirestore.instance
                //           .collection('error')
                //           .where('date', isEqualTo: date)
                //           .where('level', isEqualTo: level)
                //           .get(),
                //       builder: (context, snapshot) {
                //         if (snapshot.hasData) {
                //           // Use snapshot.data to display the retrieved data
                //           return Text(
                //               '${snapshot.data?.size.toString()} warning(s)',
                //               style: const TextStyle(
                //                 fontFamily: 'Inter',
                //                 fontSize: 12,
                //               ));
                //         } else if (snapshot.hasError) {
                //           return Text('Error: ${snapshot.error}');
                //         } else {
                //           return Text('Loading...');
                //         }
                //       },
                //     ),
                //   ],
                // ),
                // Text('$warncount warning(s), $critcount critical(s) ',
                //     style: const TextStyle(
                //       fontFamily: 'Inter',
                //       fontSize: 12,
                //     )),
                Text(
                  date,
                  style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12,
                      color: Color.fromRGBO(129, 127, 127, 1)),
                )
              ],
            ),
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VitalSign(
                      name: 'Heart Rate',
                      imgurl: 'assets/images/hricon.png',
                      value: hrvalue,
                      unit: 'BPM',
                      edge: const EdgeInsets.only(left: 29, top: 10),
                    ),
                    VitalSign(
                      name: 'SpO2',
                      imgurl: 'assets/images/o2icon.png',
                      value: spo2value,
                      unit: '%',
                      edge: const EdgeInsets.only(left: 29, top: 5),
                    ),
                  ],
                ),
                const VerticalDivider(
                  color: Colors.black,
                  thickness: 2,
                  indent: 10,
                  endIndent: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VitalSign(
                      name: 'Respiratory Rate',
                      imgurl: 'assets/images/lung-s.png',
                      value: rrvalue,
                      unit: 'breaths/min',
                      fontsize: 12,
                      edge: const EdgeInsets.only(right: 29, top: 11),
                    ),
                    VitalSign(
                      name: 'Skin Temperature',
                      imgurl: 'assets/images/tempicon.png',
                      value: skintempvalue,
                      unit: '°C',
                      edge: const EdgeInsets.only(right: 29, top: 5),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class VitalSign extends StatelessWidget {
  final String name;
  final String imgurl;
  final EdgeInsets edge;
  final String unit;
  final double? fontsize;
  final String value;
  final Color color;

  const VitalSign(
      {super.key,
      required this.name,
      required this.imgurl,
      required this.edge,
      required this.unit,
      required this.value,
      this.color = const Color.fromRGBO(136, 194, 80, 1),
      this.fontsize = 15});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: edge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Image.asset(imgurl),
            Container(
              margin: const EdgeInsets.only(left: 6),
              child: Text(
                name,
                style: const TextStyle(fontFamily: 'Inter', fontSize: 12),
              ),
            )
          ]),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    // ignore: sort_child_properties_last
                    child: Text(
                      value,
                      style: TextStyle(
                          // color: Color.fromRGBO(136, 194, 80, 1),
                          fontFamily: 'Inter',
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 2
                            ..color = const Color.fromRGBO(0, 0, 0, 1)),
                    ),
                    margin: const EdgeInsets.only(top: 3),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 3),
                    child: Text(
                      value,
                      style: TextStyle(
                        // color: Color.fromRGBO(136, 194, 80, 1),
                        fontFamily: 'Inter',
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: changeColor(name, int.parse(value)),
                        // color: color
                      ),
                    ),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 3),
                child: Text(
                  unit,
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: fontsize,
                      color: const Color.fromRGBO(129, 127, 127, 1)),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
