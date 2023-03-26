import 'package:flutter/material.dart';
import 'package:vitalsenseapp/card/historycard.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:vitalsenseapp/pages/home.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPage();
}

class _HistoryPage extends State<HistoryPage> {
  int _count = 0;
  String range = 'eachDay';

  @override
  void initState() {
    super.initState();
    _getCount();
  }

  Future<void> _getCount() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('eachDay').get();

    setState(() {
      _count = querySnapshot.size;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SliderDrawer(
        // sliderOpenSize: 2000,
        appBar: const SliderAppBar(
            drawerIconSize: 35,
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
                      Icons.home_filled,
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
                    Icons.history_rounded,
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
          // margin: const EdgeInsets.only(top: 80),
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      'assets/images/wall.jpg'), //change bg image here
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.only(top: 38, left: 38, right: 38),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.cyan,
                  child: const Text('Graph'),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'History',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      DropdownButton(
                          elevation: 2,
                          style: const TextStyle(
                              fontFamily: 'Inter', color: Colors.black),
                          value: range,
                          items: const [
                            DropdownMenuItem(
                              value: 'eachDay',
                              child: Text('Day'),
                            ),
                            DropdownMenuItem(
                              value: 'week',
                              child: Text('Week'),
                            )
                          ],
                          onChanged: (String? value) {
                            setState(() {
                              range = value!;
                            });
                          })
                    ],
                  ),
                ),
                SizedBox(
                    height: 425,
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection(range)
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Text('Loading...');
                        }
                        _count = snapshot.data!.docs.length;
                        return ListView.builder(
                          // shrinkWrap: true,
                          itemCount: _count,
                          itemBuilder: ((context, index) => HistoryCard(
                                // date: (snapshot.data!.docs[index]['date'])
                                //     .toString(), //need to add week date
                                warncount: '${index + 1}',
                                critcount: '$index',
                                hrvalue: (snapshot.data!.docs[index]['hr'])
                                    .toString(),
                                spo2value: (snapshot.data!.docs[index]['spo2'])
                                    .toString(),
                                rrvalue:
                                    '16', //need to convert to int in Node.js first
                                skintempvalue: (snapshot.data!.docs[index]
                                        ['bodytemp'])
                                    .toString(),
                              )),
                          scrollDirection: Axis.vertical,
                          padding: const EdgeInsets.only(bottom: 20),
                          // addAutomaticKeepAlives: true,
                        );
                      },
                    )),
                // SizedBox(
                //     height: 425,
                //     child: ListView.builder(
                //       shrinkWrap: true,
                //       itemBuilder: ((context, index) => HistoryCard(
                //             warncount: '${index + 1}',
                //             critcount: '$index',
                //             hrvalue: '101',
                //             spo2value: '20',
                //             rrvalue: '16',
                //             skintempvalue: '36',
                //           )),
                //       scrollDirection: Axis.vertical,
                //       padding: const EdgeInsets.only(bottom: 20),
                //       // addAutomaticKeepAlives: true,
                //     )),
              ],
            ),
          ),
        ),
      ),
      // extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   // title: Text('text'),
      //   elevation: 0,
      //   foregroundColor: Colors.black,
      //   // backgroundColor: Colors.transparent,
      //   leading: Builder(builder: (BuildContext context) {
      //     return Padding(
      //       padding: const EdgeInsets.only(left: 10),
      //       child: IconButton(
      //         icon: const Icon(
      //           Icons.menu,
      //           size: 40,
      //         ),
      //         onPressed: () => Scaffold.of(context).openDrawer(),
      //         tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      //       ),
      //     );
      //   }),
      // ),
      // drawer: Drawer(
      //   width: 200,
      //   child: Padding(
      //     padding: const EdgeInsets.only(top: 20, left: 10),
      //     child: ListView(
      //       physics: const NeverScrollableScrollPhysics(),
      //       children: const [
      //         ListTile(
      //           leading: Icon(
      //             Icons.home,
      //             color: Colors.amber,
      //           ),
      //           title: Text(
      //             'Home',
      //             style: TextStyle(
      //                 fontFamily: 'Inter', fontWeight: FontWeight.bold),
      //           ),
      //         ),
      //         ListTile(
      //           leading: Icon(
      //             Icons.history,
      //             color: Colors.amber,
      //           ),
      //           title: Text(
      //             'History',
      //             style: TextStyle(
      //                 fontFamily: 'Inter', fontWeight: FontWeight.bold),
      //           ),
      //         )
      //       ],
      //     ),
      //   ),
      //   // child: ListView(
      //   //   children: [
      //   //     DrawerHeader(
      //   //         child: Container(
      //   //       color: Colors.black,
      //   //       alignment: Alignment.center,
      //   //       child: Text(
      //   //         'aifaf',
      //   //         style: TextStyle(color: Colors.white),
      //   //       ),
      //   //     ))
      //   //   ],
      //   // ),
      // ),
      // body: Container(
      //   margin: const EdgeInsets.only(top: 80),
      //   height: double.infinity,
      //   width: double.infinity,
      //   decoration: const BoxDecoration(
      //       image: DecorationImage(
      //           image:
      //               AssetImage('assets/images/wall.jpg'), //change bg image here
      //           fit: BoxFit.cover)),
      //   child: Padding(
      //     padding: const EdgeInsets.only(top: 38, left: 38, right: 38),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: [
      //         Container(
      //           height: 200,
      //           width: double.infinity,
      //           color: Colors.cyan,
      //           child: const Text('Graph'),
      //         ),
      //         Container(
      //           margin: EdgeInsets.only(top: 20, bottom: 20),
      //           alignment: Alignment.centerLeft,
      //           child: const Text(
      //             'History',
      //             style: TextStyle(
      //                 fontFamily: 'Inter',
      //                 fontSize: 20,
      //                 fontWeight: FontWeight.bold),
      //           ),
      //         ),
      //         // Container(
      //         //   // margin: EdgeInsets.only(top: 20),
      //         //   height: 500,
      //         //   child: ListView(
      //         //     children: items,
      //         //   ),
      //         // )
      //         SizedBox(
      //             height: 445,
      //             child: ListView.builder(
      //               itemBuilder: ((context, index) => HistoryCard(
      //                     warncount: '${index + 1}',
      //                     critcount: '$index',
      //                     hrvalue: '101',
      //                     spo2value: '20',
      //                     rrvalue: '16',
      //                     skintempvalue: '36',
      //                   )),
      //               scrollDirection: Axis.vertical,
      //               padding: const EdgeInsets.only(bottom: 20),
      //               // addAutomaticKeepAlives: true,
      //             )),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
