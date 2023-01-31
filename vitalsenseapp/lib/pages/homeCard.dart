import 'package:flutter/material.dart';

class homeCard extends StatefulWidget {
  const homeCard({super.key});

  @override
  State<homeCard> createState() => _homeCardState();
}

class _homeCardState extends State<homeCard> {
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   margin: EdgeInsets.all(15.0),
    //   color: Colors.green,
    //   width: 93,
    //   height: 156,
    //   child: Stack(
    //     children: [
    //       Positioned(
    //         top: 14,
    //         left: 0,
    //         child: Container(),
    //       )
    //     ],
    //   ),
    // );
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
                            color: Color.fromRGBO(252, 200, 66, 1),
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
                                    '70',
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
                                'Celsius',
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
          // Positioned(
          //     top: 6,
          //     left: 41,
          //     child: Container(
          //       width: 16,
          //       height: 16,
          //       decoration: BoxDecoration(
          //         color: Color.fromRGBO(255, 255, 255, 1),
          //       ),
          //     )),
        ]));
  }
}
