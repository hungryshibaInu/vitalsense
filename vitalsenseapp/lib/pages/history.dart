import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:vitalsenseapp/card/historycard.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:vitalsenseapp/function/changecolorfunc.dart';
// import 'package:rxdart/rxdart.dart';
// import 'package:vitalsenseapp/pages/home.dart';

class BarchartValue {
  final String name;
  final int value;
  BarchartValue({required this.name, required this.value});
}

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPage();
}

class _HistoryPage extends State<HistoryPage> {
  List<BarchartValue> barListvalue = [];
  int _count = 0;
  String collection = 'eachDay';
  // DateTime startDate = DateTime.parse('2022-01-01');
  String startDate = '2022-01-01';

  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  // void getData() async {
  //   final QuerySnapshot snapshot =
  //       await FirebaseFirestore.instance.collection(collection).get();
  //   final List<BarchartValue> data = snapshot.docs.map((doc) {
  //     return BarchartValue(name: 'test', value: doc['rr']);
  //   }).toList();

  //   setState(() {
  //     barListvalue = data;
  //   });
  // }
  // Future<void> _getCount() async {
  //   QuerySnapshot querySnapshot =
  //       await FirebaseFirestore.instance.collection('eachDay').get();

  //   setState(() {
  //     _count = querySnapshot.size;
  //   });
  // }

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
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection(collection)
                .where('date', isGreaterThanOrEqualTo: _selectedDate.toString())
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text('Loading...');
              }
              _count = snapshot.data!.docs.length;

              return Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/wall.jpg'), //change bg image here
                        fit: BoxFit.cover)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 38, right: 38),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 235,
                        child: CarouselSlider(
                          items: [
                            Chart(
                              collection: collection,
                              vital: 'Heart Rate',
                              type: 'hr',
                            ),
                            Chart(
                              collection: collection,
                              vital: 'SpO2',
                              type: 'spo2',
                            ),
                            Chart(
                              collection: collection,
                              vital: 'Respiratory Rate',
                              type: 'rr',
                            ),
                            Chart(
                              collection: collection,
                              vital: 'Skin Temperature',
                              type: 'bodytemp',
                            ),
                          ],
                          options: CarouselOptions(viewportFraction: 1),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20, bottom: 20),
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  // 'History ($_count)',
                                  'History',
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.only(left: 10),
                                //   child: Text(
                                //     '${_selectedDate.year}-${_selectedDate.month}-${_selectedDate.day}',
                                //     style: TextStyle(
                                //         fontSize: 12,
                                //         fontWeight: FontWeight.bold),
                                //   ),
                                // ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: ElevatedButton(
                                    onPressed: () => _selectDate(context),
                                    child: Text(
                                        '${_selectedDate.year}-${_selectedDate.month}-${_selectedDate.day}'),
                                  ),
                                ),
                              ],
                            ),
                            DropdownButton(
                                isDense: true,
                                elevation: 2,
                                style: const TextStyle(
                                    fontFamily: 'Inter', color: Colors.black),
                                value: collection,
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
                                    collection = value!;
                                  });
                                })
                          ],
                        ),
                      ),
                      SizedBox(
                          height: 425,
                          child: ListView.builder(
                            // shrinkWrap: true,
                            itemCount: _count,
                            itemBuilder: ((context, index) => InkWell(
                                  onTap: () {
                                    setState(() {
                                      startDate =
                                          snapshot.data!.docs[index]['date'];
                                    });
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Container(
                                            color: const Color(0xFFFFF9F3),
                                            height: 500,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child:
                                                  Warninglog(date: startDate),
                                              // child: ListView.builder(
                                              //   itemBuilder: ((context,
                                              //           index) =>
                                              //       ListTile(
                                              //         title: Text(
                                              //           'test $index',
                                              //           style: TextStyle(
                                              //               fontFamily: 'Inter',
                                              //               fontSize: 15),
                                              //         ),
                                              //       )),
                                              //   itemCount: 10,
                                              // ),
                                            ),
                                          );
                                        });
                                  },
                                  // onTap: () {
                                  //   Navigator.of(context).push(
                                  //       MaterialPageRoute(
                                  //           builder: (context) =>
                                  //               const WarninglogPage()));
                                  // },
                                  child: HistoryCard(
                                    date: (snapshot.data!.docs[index]['date'])
                                        .toString(), //needed to add week date
                                    warncount: '${index + 1}',
                                    critcount: '$index',
                                    hrvalue: (snapshot.data!.docs[index]['hr'])
                                        .toString(),
                                    spo2value: (snapshot.data!.docs[index]
                                            ['spo2'])
                                        .toString(),
                                    rrvalue: (snapshot.data!.docs[index]['rr'])
                                        .toString(), //need to convert to int in Node.js first
                                    skintempvalue: (snapshot.data!.docs[index]
                                            ['bodytemp'])
                                        .toString(),
                                  ),
                                )),
                            scrollDirection: Axis.vertical,
                            padding: const EdgeInsets.only(bottom: 20),
                            // addAutomaticKeepAlives: true,
                          )),
                    ],
                  ),
                ),
              );
            },
          )),
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

class Chart extends StatefulWidget {
  final String collection;
  final String vital;
  final String type; // temporary
  final String date;

  const Chart(
      {super.key,
      required this.collection,
      required this.vital,
      required this.type,
      this.date = '2023-9-1'});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  // final String collection;

  // _ChartState({required this.collection});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream:
          FirebaseFirestore.instance.collection(widget.collection).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Loading...');
        }

        List<BarchartValue> barListvalue = snapshot.data!.docs.map((doc) {
          return BarchartValue(name: 'test', value: doc[widget.type]);
        }).toList();

        return Padding(
          padding: const EdgeInsets.only(top: 35),
          child: BarChart(BarChartData(
            barGroups: barListvalue
                .asMap()
                .map((index, value) => MapEntry(
                    index,
                    BarChartGroupData(
                      x: index,
                      barRods: [
                        BarChartRodData(
                          toY: value.value.toDouble(),
                          width: 16.0,
                          color: changeColor(widget.vital, value.value),
                        )
                      ],
                      // showingTooltipIndicators: [1]
                    )))
                .values
                .toList(),
            titlesData: FlTitlesData(
              show: true,
              topTitles: AxisTitles(
                  sideTitles: SideTitles(
                      getTitlesWidget: (value, meta) {
                        // return Text('dd/${value.toInt() + 10}');
                        return Text(widget.date.substring(5));
                        // return Text(meta.formattedValue);
                      },
                      showTitles: true)),
              bottomTitles: AxisTitles(
                axisNameWidget: Text(
                  widget.vital,
                  style: const TextStyle(
                      fontFamily: 'Inter', fontWeight: FontWeight.w100),
                ),
              ),
              leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                      getTitlesWidget: (value, meta) {
                        return Text(
                          '${value.toInt()}',
                          style: const TextStyle(fontFamily: 'Inter'),
                        );
                      },
                      showTitles: true)),
              rightTitles:
                  AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            borderData: FlBorderData(
              show: true,
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.shade300,
                  width: 2.0,
                ),
              ),
            ),
          )),
        );
      },
    );
  }
}

//create bottom sheet from line 225
class Warninglog extends StatefulWidget {
  // final DateTime date;
  final String date;

  const Warninglog({super.key, required this.date});

  @override
  State<Warninglog> createState() => _WarninglogState();
}

class _WarninglogState extends State<Warninglog> {
  DateTime test = DateTime.parse('2023-5-25');
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('error')
          .where('date', isEqualTo: widget.date)
          .snapshots(),
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error.toString()}'),
          );
        }

        if (!snapshot.hasData) {
          return const Center(
            child: Text('data'),
          );
        }
        final List<DocumentSnapshot<Map<String, dynamic>>> docs =
            snapshot.data!.docs;

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Warning Log (${widget.date}) :',
                    style: const TextStyle(fontFamily: 'Inter'),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(top: 10),
                height: 400,
                child: ListView.builder(
                  itemCount: docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Map<String, dynamic>? data = docs[index].data();

                    return ListTile(
                      leading: Text(
                        // data!['time'],
                        '${test.add(Duration(days: 7)).toString()}',
                        style: const TextStyle(
                            fontFamily: 'Inter',
                            color: Color.fromARGB(255, 128, 127, 127)),
                      ),
                      title: Row(
                        children: [
                          Text(
                            '${data!['type']}: ',
                            style: const TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.normal,
                                fontSize: 16),
                          ),
                          Text(data['data'],
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: changelogColor(data['level']))),
                        ],
                      ),
                      // subtitle: Text(data['type']),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
