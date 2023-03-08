import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  final String date;
  final String warncount;
  final String critcount;
  const HistoryCard(
      {super.key,
      this.date = 'dd/mm/yyyy',
      this.warncount = '0',
      this.critcount = '0'});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 28, top: 15),
                child: Text("$warncount warning(s), $critcount critical(s) ",
                    style: const TextStyle(fontFamily: 'Inter', fontSize: 12)),
              ),
              Container(
                margin: const EdgeInsets.only(right: 28, top: 15),
                child: Text(
                  date,
                  style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12,
                      color: Color.fromRGBO(129, 127, 127, 1)),
                ),
              )
            ],
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
                      value: '100',
                      unit: 'BPM',
                      edge: const EdgeInsets.only(left: 29, top: 10),
                    ),
                    VitalSign(
                      name: 'SpO2',
                      imgurl: 'assets/images/o2icon.png',
                      value: '98',
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
                      value: '16',
                      unit: 'breaths/min',
                      fontsize: 12,
                      edge: const EdgeInsets.only(right: 29, top: 11),
                    ),
                    VitalSign(
                      name: 'Skin Temerature',
                      imgurl: 'assets/images/tempicon.png',
                      value: '36',
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
      this.color = const Color.fromRGBO(136, 194, 80, 1),
      this.value = '0',
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
                        color: color,
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
