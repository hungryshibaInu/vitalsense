import 'package:flutter/material.dart';
import 'package:vitalsenseapp/card/historycard.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPage();
}

class _HistoryPage extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 38),
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image:
                    AssetImage('assets/images/wall.jpg'), //change bg image here
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.only(top: 38, left: 38, right: 38),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 150,
                width: double.infinity,
                color: Colors.cyan,
                child: const Text('Graph'),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Text('History'),
              ),
              // Container(
              //   // margin: EdgeInsets.only(top: 20),
              //   height: 500,
              //   child: ListView(
              //     children: items,
              //   ),
              // )
              SizedBox(
                  height: 547,
                  child: ListView.builder(
                      itemBuilder: ((context, index) => HistoryCard(
                            warncount: '${index + 1}',
                            critcount: '$index',
                            hrvalue: '101',
                            spo2value: '98',
                            rrvalue: '16',
                            skintempvalue: '36',
                          )))),
            ],
          ),
        ),
      ),
    );
  }
}
