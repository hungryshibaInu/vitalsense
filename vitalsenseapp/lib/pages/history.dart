import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:vitalsenseapp/card/historycard.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:vitalsenseapp/function/changecolorfunc.dart';
import 'package:intl/intl.dart';

import 'login.dart';

// import 'package:vitalsenseapp/pages/home.dart';
DateTime getSundayOfWeek(DateTime date) {
  if (DateFormat('EEEE').format(date) == 'Sunday') {
    date = date.add(Duration(days: 1));
  }
  print(date);
  return date.subtract(Duration(days: date.weekday));
}

String addLeadingZeros(String date) {
  List<String> dateParts = date.split('-');
  String year = dateParts[0];
  String month = dateParts[1].padLeft(2, '0');
  String day = dateParts[2].padLeft(2, '0');
  return '$year-$month-$day';
}

String addLeadingZerosToTime(String timeString) {
  List<String> timeParts = timeString.split(':');
  String hour = timeParts[0].padLeft(2, '0');
  String minute = timeParts[1].padLeft(2, '0');
  return '$hour:$minute';
}

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
  // String _date = '2022-01-01';
  // DateTime _date = DateTime.parse('2022-01-01');
  String _date = '2023-03-25';

  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _date = addLeadingZeros(
            '${_selectedDate.year}-${_selectedDate.month}-${_selectedDate.day}');
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SliderDrawer(
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
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.logout,
                      color: Colors.amber,
                      size: 30,
                    ),
                    title: const Text(
                      'Logout',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Login())),
                  )
                ],
              ),
            ),
          ),
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection(collection)
                .where('date',
                    isGreaterThanOrEqualTo:
                        (getSundayOfWeek(DateTime.parse(_date))
                            .toString()
                            .substring(0, 10)),
                    isLessThanOrEqualTo: (getSundayOfWeek(DateTime.parse(_date))
                            .add(Duration(days: 6)))
                        .toString()
                        .substring(0, 10))
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
                              date: _date,
                            ),
                            Chart(
                              collection: collection,
                              vital: 'SpO2',
                              type: 'spo2',
                              date: _date,
                            ),
                            Chart(
                              collection: collection,
                              vital: 'Respiratory Rate',
                              type: 'rr',
                              date: _date,
                            ),
                            Chart(
                              collection: collection,
                              vital: 'Skin Temperature',
                              type: 'bodytemp',
                              date: _date,
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
                                  child: TextButton(
                                      onPressed: () => _selectDate(context),
                                      child: Text(
                                        _date,
                                        style: const TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            fontFamily: 'Inter',
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black),
                                      )),
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
                                      _date =
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
                                              child: Warninglog(date: _date),
                                            ),
                                          );
                                        });
                                  },
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
      required this.date});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection(widget.collection)
          .where('date',
              isGreaterThanOrEqualTo:
                  (getSundayOfWeek(DateTime.parse(widget.date))
                      .toString()
                      .substring(0, 10)),
              isLessThanOrEqualTo: (getSundayOfWeek(DateTime.parse(widget.date))
                      .add(Duration(days: 6)))
                  .toString()
                  .substring(0, 10))
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Loading...');
        }

        List<BarchartValue> barListvalue = snapshot.data!.docs.map((doc) {
          return BarchartValue(name: doc['date'], value: doc[widget.type]);
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
                        // return Text('5/${value.toInt() + 10}');
                        return Text(widget.date.substring(5));
                        // return Text(barListvalue.name[meta]);
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
  // DateTime test = DateTime.parse('2023-05-25');
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('error')
          .where('date', isEqualTo: widget.date)
          // .orderBy((document) => addLeadingZerosToTime('${document['time']}'))
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
        docs.sort((a, b) => addLeadingZerosToTime('${a['time']}')
            .compareTo(addLeadingZerosToTime('${b['time']}')));

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
                        data!['time'],
                        // '${test.add(Duration(days: 7)).toString()}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Inter',
                            color: Color.fromARGB(255, 128, 127, 127)),
                      ),
                      title: Row(
                        children: [
                          Text(
                            '${data['type']}: ',
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
