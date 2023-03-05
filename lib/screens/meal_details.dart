import 'package:flutter/material.dart';

class MealDetails extends StatelessWidget {
  // final String title;
  static const routeName = "/meal-details-screen";

  // MealDetails({
  //   @required this.title,
  // });
  @override
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(id),
      ),
      body: Center(
        child: Text(id),
      ),
    );
  }
}
