import 'package:flutter/material.dart';

class Notification {
  final Icon type;
  final String text;
  final String time;

  Notification({required this.type, required this.text, required this.time});
}

class NotiPage extends StatefulWidget {
  const NotiPage({super.key});

  @override
  State<NotiPage> createState() => _NotiPageState();
}

class _NotiPageState extends State<NotiPage> {
  List<Notification> notiList = [];

  void addNotiList(Icon _type, String _text, String _time) {
    setState(() {
      notiList.add(Notification(type: _type, text: _text, time: _time));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            title: Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Notification',
                style: TextStyle(color: Colors.black, fontFamily: 'Inter'),
              ),
            ),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () => Navigator.pop(context),
            )),
        body: ListView.builder(
          itemCount: notiList.length,
          itemBuilder: (context, index) {
            return ListTile(
              // leading: Icon(notiList[index].type),
              title: Text(notiList[index].text),
            );
          },
        ));
  }
}
