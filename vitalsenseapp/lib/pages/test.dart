import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainWidget extends StatefulWidget {
  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator MainWidget - COMPONENT

    return Container(
        width: 389,
        height: 844,
        child: Stack(children: <Widget>[
          Positioned(
              top: -270,
              left: -319,
              child: Container(
                  width: 1010,
                  height: 1010,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 249, 243, 1),
                    borderRadius:
                        BorderRadius.all(Radius.elliptical(1010, 1010)),
                  ))),
          Positioned(
              top: 198,
              left: 82,
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
                    color: const Color.fromRGBO(136, 194, 80, 1),
                    border: Border.all(
                      color: const Color.fromRGBO(0, 0, 0, 1),
                      width: 3,
                    ),
                    borderRadius:
                        const BorderRadius.all(Radius.elliptical(214, 214)),
                  ))),
          Positioned(
              top: 223,
              left: 107,
              child: Container(
                  width: 163,
                  height: 163,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 249, 243, 1),
                    border: Border.all(
                      color: const Color.fromRGBO(0, 0, 0, 1),
                      width: 3,
                    ),
                    borderRadius:
                        const BorderRadius.all(Radius.elliptical(163, 163)),
                  ))),
          const Positioned(
              top: 295,
              left: 102,
              child: Text(
                '14',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Inter',
                    fontSize: 70,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 0.2857142857142857),
              )),
          const Positioned(
              top: 343,
              left: 89,
              child: Text(
                'BPM',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Inter',
                    fontSize: 20,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          const Positioned(
              top: 113,
              left: 147,
              child: Text(
                'Hello!, User',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Inter',
                    fontSize: 20,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top: 96,
              left: 40,
              child: Container(
                  width: 54,
                  height: 53,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/Menu1.png'),
                        fit: BoxFit.fitWidth),
                  ))),
          Positioned(
              top: 235,
              left: 172,
              child: Container(
                  width: 34,
                  height: 34,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  child: Stack(children: <Widget>[
                    Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                            width: 34,
                            height: 34,
                            child: Stack(children: <Widget>[
                              Positioned(
                                  top: 6.109375,
                                  left: 20.0546875,
                                  child: SvgPicture.asset(
                                      'assets/images/vector.svg',
                                      semanticsLabel: 'vector')),
                              Positioned(
                                  top: 6.109375,
                                  left: 0,
                                  child: SvgPicture.asset(
                                      'assets/images/vector.svg',
                                      semanticsLabel: 'vector')),
                              Positioned(
                                  top: 0,
                                  left: 13.9453125,
                                  child: SvgPicture.asset(
                                      'assets/images/vector.svg',
                                      semanticsLabel: 'vector')),
                            ]))),
                  ]))),
          Positioned(
              top: 457.9999694824219,
              left: 31.000003814697266,
              child: Container(
                  width: 319,
                  height: 157.0001220703125,
                  child: Stack(children: <Widget>[
                    Positioned(
                        top: 1,
                        left: 226,
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
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                        ),
                                        boxShadow: const [
                                          BoxShadow(
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.25),
                                              offset: Offset(0, 4),
                                              blurRadius: 4)
                                        ],
                                        color: const Color.fromRGBO(
                                            136, 194, 80, 1),
                                        border: Border.all(
                                          color:
                                              const Color.fromRGBO(0, 0, 0, 1),
                                          width: 2,
                                        ),
                                      ))),
                              Positioned(
                                  top: 38,
                                  left: 17,
                                  child: Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            254, 248, 242, 1),
                                        border: Border.all(
                                          color:
                                              const Color.fromRGBO(0, 0, 0, 1),
                                          width: 2,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            Radius.elliptical(60, 60)),
                                      ))),
                              const Positioned(
                                  top: 58,
                                  left: 16,
                                  child: Text(
                                    '89',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                        fontFamily: 'Inter',
                                        fontSize: 30,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.normal,
                                        height: 0.6666666666666666),
                                  )),
                              Positioned(
                                  top: 0,
                                  left: 34,
                                  child: Container(
                                      width: 29,
                                      height: 29,
                                      decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            255, 249, 243, 1),
                                        border: Border.all(
                                          color:
                                              const Color.fromRGBO(0, 0, 0, 1),
                                          width: 2,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            Radius.elliptical(29, 29)),
                                      ))),
                              Positioned(
                                  top: 7,
                                  left: 41,
                                  child: Container(
                                      width: 15,
                                      height: 15,
                                      decoration: const BoxDecoration(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                      ),
                                      child: Stack(children: <Widget>[
                                        Positioned(
                                            top: 0.7617184519767761,
                                            left: 0.000034618686186149716,
                                            child: SvgPicture.asset(
                                                'assets/images/vector.svg',
                                                semanticsLabel: 'vector')),
                                      ]))),
                              const Positioned(
                                  top: 107,
                                  left: 3,
                                  child: Text(
                                    'BPM',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                        fontFamily: 'Inter',
                                        fontSize: 15,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.normal,
                                        height: 1.3333333333333333),
                                  )),
                            ]))),
                    Positioned(
                        top: 0,
                        left: 113,
                        child: Container(
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
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20),
                                                    topRight:
                                                        Radius.circular(20),
                                                    bottomLeft:
                                                        Radius.circular(20),
                                                    bottomRight:
                                                        Radius.circular(20),
                                                  ),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                        color: Color.fromRGBO(
                                                            0, 0, 0, 0.25),
                                                        offset: Offset(0, 4),
                                                        blurRadius: 4)
                                                  ],
                                                  color: const Color.fromRGBO(
                                                      136, 194, 80, 1),
                                                  border: Border.all(
                                                    color: const Color.fromRGBO(
                                                        0, 0, 0, 1),
                                                    width: 2,
                                                  ),
                                                ))),
                                        Positioned(
                                            top: 38,
                                            left: 17,
                                            child: Container(
                                                width: 60,
                                                height: 60,
                                                decoration: BoxDecoration(
                                                  color: const Color.fromRGBO(
                                                      254, 248, 242, 1),
                                                  border: Border.all(
                                                    color: const Color.fromRGBO(
                                                        0, 0, 0, 1),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.elliptical(
                                                              60, 60)),
                                                ))),
                                        const Positioned(
                                            top: 58,
                                            left: 16,
                                            child: Text(
                                              '90',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 1),
                                                  fontFamily: 'Inter',
                                                  fontSize: 30,
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.normal,
                                                  height: 0.6666666666666666),
                                            )),
                                        Positioned(
                                            top: 0,
                                            left: 34,
                                            child: Container(
                                                width: 29,
                                                height: 29,
                                                decoration: BoxDecoration(
                                                  color: const Color.fromRGBO(
                                                      255, 249, 243, 1),
                                                  border: Border.all(
                                                    color: const Color.fromRGBO(
                                                        0, 0, 0, 1),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.elliptical(
                                                              29, 29)),
                                                ))),
                                        const Positioned(
                                            top: 107,
                                            left: 3,
                                            child: Text(
                                              '%',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 1),
                                                  fontFamily: 'Inter',
                                                  fontSize: 15,
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1.3333333333333333),
                                            )),
                                      ]))),
                              Positioned(
                                  top: 4,
                                  left: 39,
                                  child: Container(
                                      width: 19,
                                      height: 19,
                                      decoration: const BoxDecoration(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                      ),
                                      child: Stack(children: <Widget>[
                                        Positioned(
                                            top: 2.59765625,
                                            left: -1.3183898417423734e-16,
                                            child: Container(
                                                width: 19,
                                                height: 13.8046875,
                                                child: Stack(children: <Widget>[
                                                  Positioned(
                                                      top: 0,
                                                      left: 0,
                                                      child: SvgPicture.asset(
                                                          'assets/images/vector.svg',
                                                          semanticsLabel:
                                                              'vector')),
                                                  Positioned(
                                                      top: 5.8447265625,
                                                      left: 6.2158203125,
                                                      child: SvgPicture.asset(
                                                          'assets/images/vector.svg',
                                                          semanticsLabel:
                                                              'vector')),
                                                ]))),
                                      ]))),
                            ]))),
                    Positioned(
                        top: 1.0001220703125,
                        left: 0,
                        child: Container(
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
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20),
                                                    topRight:
                                                        Radius.circular(20),
                                                    bottomLeft:
                                                        Radius.circular(20),
                                                    bottomRight:
                                                        Radius.circular(20),
                                                  ),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                        color: Color.fromRGBO(
                                                            0, 0, 0, 0.25),
                                                        offset: Offset(0, 4),
                                                        blurRadius: 4)
                                                  ],
                                                  color: const Color.fromRGBO(
                                                      252, 200, 66, 1),
                                                  border: Border.all(
                                                    color: const Color.fromRGBO(
                                                        0, 0, 0, 1),
                                                    width: 2,
                                                  ),
                                                ))),
                                        Positioned(
                                            top: 38,
                                            left: 17,
                                            child: Container(
                                                width: 60,
                                                height: 60,
                                                decoration: BoxDecoration(
                                                  color: const Color.fromRGBO(
                                                      254, 248, 242, 1),
                                                  border: Border.all(
                                                    color: const Color.fromRGBO(
                                                        0, 0, 0, 1),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.elliptical(
                                                              60, 60)),
                                                ))),
                                        const Positioned(
                                            top: 58,
                                            left: 16,
                                            child: Text(
                                              '70',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 1),
                                                  fontFamily: 'Inter',
                                                  fontSize: 30,
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.normal,
                                                  height: 0.6666666666666666),
                                            )),
                                        Positioned(
                                            top: 0,
                                            left: 34,
                                            child: Container(
                                                width: 29,
                                                height: 29,
                                                decoration: BoxDecoration(
                                                  color: const Color.fromRGBO(
                                                      255, 249, 243, 1),
                                                  border: Border.all(
                                                    color: const Color.fromRGBO(
                                                        0, 0, 0, 1),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.elliptical(
                                                              29, 29)),
                                                ))),
                                        const Positioned(
                                            top: 107,
                                            left: 3,
                                            child: Text(
                                              'Celsius',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 1),
                                                  fontFamily: 'Inter',
                                                  fontSize: 15,
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1.3333333333333333),
                                            )),
                                      ]))),
                              Positioned(
                                  top: 6,
                                  left: 41,
                                  child: Container(
                                      width: 16,
                                      height: 16,
                                      decoration: const BoxDecoration(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                      ),
                                      child: Stack(children: <Widget>[
                                        Positioned(
                                            top: 3.725585460662842,
                                            left: 5.15625,
                                            child: SvgPicture.asset(
                                                'assets/images/vector.svg',
                                                semanticsLabel: 'vector')),
                                        Positioned(
                                            top: -2.384185791015625e-7,
                                            left: 3.28125,
                                            child: SvgPicture.asset(
                                                'assets/images/vector.svg',
                                                semanticsLabel: 'vector')),
                                        Positioned(
                                            top: 7.4840087890625,
                                            left: 10.32421875,
                                            child: SvgPicture.asset(
                                                'assets/images/vector.svg',
                                                semanticsLabel: 'vector')),
                                        Positioned(
                                            top: 5.608642101287842,
                                            left: 10.32421875,
                                            child: SvgPicture.asset(
                                                'assets/images/vector.svg',
                                                semanticsLabel: 'vector')),
                                        Positioned(
                                            top: 3.733275890350342,
                                            left: 10.32421875,
                                            child: SvgPicture.asset(
                                                'assets/images/vector.svg',
                                                semanticsLabel: 'vector')),
                                        Positioned(
                                            top: 1.857909917831421,
                                            left: 10.32421875,
                                            child: SvgPicture.asset(
                                                'assets/images/vector.svg',
                                                semanticsLabel: 'vector')),
                                      ]))),
                            ]))),
                  ]))),
          Positioned(
              top: 84,
              left: 270,
              child: Container(
                  width: 68,
                  height: 68,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(217, 217, 217, 1),
                    border: Border.all(
                      color: const Color.fromRGBO(0, 0, 0, 1),
                      width: 2,
                    ),
                    borderRadius:
                        const BorderRadius.all(Radius.elliptical(68, 68)),
                  ))),
        ]));
  }
}
