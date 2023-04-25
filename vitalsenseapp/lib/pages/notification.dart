import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vitalsenseapp/pages/history.dart';

String iconSelector(String _type) {
  switch (_type) {
    case 'Hr':
      return 'assets/images/hricon.png';
    case 'Spo2':
      return 'assets/images/o2icon.png';
    case 'BodyTemp':
      return 'assets/images/tempicon.png';
    case 'RR':
      return 'assets/images/lung.png';
    default:
      return 'assets/images/hricon.png';
  }
}

String textTranslate(String _type) {
  switch (_type) {
    case 'Hr':
      return 'Heart Rate';
    case 'Spo2':
      return 'Oxygen Saturation';
    case 'BodyTemp':
      return 'Body Temperature';
    case 'RR':
      return 'Respiratory Rate';
    default:
      return '???';
  }
}

// class Notification {
//   final Icon type;
//   final String text;
//   final String time;

//   Notification({required this.type, required this.text, required this.time});
// }

class NotiPage extends StatefulWidget {
  const NotiPage({super.key});

  @override
  State<NotiPage> createState() => _NotiPageState();
}

class _NotiPageState extends State<NotiPage> {
  // List<Notification> notiList = [];

  // void addNotiList(Icon _type, String _text, String _time) {
  //   setState(() {
  //     notiList.add(Notification(type: _type, text: _text, time: _time));
  //   });
  // }

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
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance
              .collection('error')
              .where('date',
                  // isEqualTo: (DateTime.now()).toString().substring(0, 10))
                  isEqualTo: '2023-04-20')
              .snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.hasData) {
              final List<DocumentSnapshot<Map<String, dynamic>>> docs =
                  snapshot.data!.docs;

              docs.sort((a, b) => addLeadingZerosToTime('${a['time']}')
                  .compareTo(addLeadingZerosToTime('${b['time']}')));

              return ListView.builder(
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  final Map<String, dynamic>? noti = docs[index].data();

                  String emoji = '🟠';
                  if (noti!['level'] == 'Danger') {
                    emoji = '🔴';
                  } else if (noti['level'] == 'Warning') {
                    emoji = '🟡';
                  }

                  //  DocumentSnapshot noti = snapshot.data!.docs[index];

                  return ListTile(
                    leading: Container(
                        height: 30,
                        width: 30,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(iconSelector(noti['type'])),
                          ],
                        )),
                    title: Text(
                      '${noti['level']}$emoji Your ${textTranslate(noti['type'])} is ${noti['data']}',
                      style: TextStyle(fontFamily: 'Inter'),
                    ),
                    subtitle: Text(
                      addLeadingZerosToTime(noti['time']),
                      style: TextStyle(fontFamily: 'Inter'),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error.toString()}'),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        )
        // ListView.builder(
        //   itemCount: notiList.length,
        //   itemBuilder: (context, index) {
        //     return ListTile(
        //       // leading: Icon(notiList[index].type),
        //       title: Text(notiList[index].text),
        //     );
        //   },
        // )
        );
  }
}
