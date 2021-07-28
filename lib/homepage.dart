import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('awsome app'),
      ),
      body: Center(
        child: Container(
          child: Text("i am homepage"),
        ),
      ),
    );
  }
}
