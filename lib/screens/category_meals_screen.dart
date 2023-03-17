import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/userwidgets/meal_item.dart';
import '../models/meal.dart';

class Catmeals extends StatelessWidget {
  // final String title;
  // final Color color;
  // final String id;
  final List<Meal> availableMeals;
  Catmeals(this.availableMeals);

  // Catmeals({this.title, this.color, this.id});
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final title = routeArgs['title'];
    final id = routeArgs['id'];
    final categoryMeals = availableMeals.where((meal) {
      return meal.categories.contains(id);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
            id: categoryMeals[index].id,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
