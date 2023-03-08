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
      body: Padding(
        padding: const EdgeInsets.all(38.0),
        child: ListView(
          // scrollDirection: Axis.vertical,
          children: [
            HistoryCard(
              date: '01/01/2001',
              warncount: '2',
            ),
            HistoryCard()
          ],
        ),
      ),
    );
  }
}
