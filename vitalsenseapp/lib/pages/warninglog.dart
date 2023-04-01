import 'package:flutter/material.dart';

class WarninglogPage extends StatelessWidget {
  const WarninglogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 34,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'History log',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
    );
  }
}
