import 'package:flutter/material.dart';

class Catmeals extends StatelessWidget {
  final String title;
  final Color color;
  final String id;

  Catmeals({this.title, this.color, this.id});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text("this is the meal !!"),
      ),
    );
  }
}
