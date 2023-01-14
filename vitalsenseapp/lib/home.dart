import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              margin: EdgeInsets.only(top: 15.0, bottom: 40.0),
              color: Colors.amber,
              width: 230,
              height: 230),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(15.0),
                color: Colors.amber,
                width: 90,
                height: 150,
              ),
              Container(
                margin: EdgeInsets.all(15.0),
                color: Colors.amber,
                width: 90,
                height: 150,
              ),
              Container(
                margin: EdgeInsets.all(15.0),
                color: Colors.amber,
                width: 90,
                height: 150,
              )
            ],
          )
        ],
      ),
    );
  }
}
