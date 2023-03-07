import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetails extends StatelessWidget {
  // final String title;

  // MealDetails({
  //   @required this.title,
  // });

  Widget createTitle(BuildContext context, String title) {
    return Container(
      child: Text(
        title,
        style: TextStyle(
          color: Colors.pink,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
    );
  }

  Widget createList(BuildContext context, Widget child) {
    return Container(
      width: 500,
      height: 250,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(10),
        color: Colors.amberAccent,
      ),
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == id);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.pink,
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover),
            ),
            createTitle(
              context,
              "Ingrediants",
            ),
            createList(
              context,
              ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(child: Text("#${index + 1}")),
                      title: Text(
                        selectedMeal.steps[index],
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Divider(
                      color: Colors.black54,
                    ),
                  ],
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            createTitle(
              context,
              "Steps",
            ),
            createList(
              context,
              ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text("#${index + 1}"),
                      ),
                      title: Text(
                        selectedMeal.steps[index],
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Divider(
                      color: Colors.black54,
                    ),
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
