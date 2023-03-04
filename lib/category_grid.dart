import 'package:flutter/material.dart';
import "category_meals_screen.dart";

class CateGrid extends StatelessWidget {
  final String title;
  final Color color;
  final String id;

  static const String namedRoute = "/category_meal_screen";

  CateGrid({this.color, this.title, this.id});

  void selectCar(BuildContext ctx) {
    // Navigator.of(ctx).push(
    //   MaterialPageRoute(builder: (_) {
    //     return Catmeals(
    //       title: title,
    //       color: color,
    //       id: id,
    //     );
    //   }),
    // );

    Navigator.of(ctx).pushNamed(
      namedRoute,
      arguments: {
        'id': id,
        "title": title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCar(context),
      borderRadius: BorderRadius.circular(15),
      splashColor: Colors.amber,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
