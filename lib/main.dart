import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/meal_details_screen.dart';
import 'package:flutter_complete_guide/userwidgets/meal_item.dart';
import 'screens/catagories_screen.dart';
import 'screens/category_meals_screen.dart';
import 'userwidgets/category_grid.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Railway',
        textTheme: ThemeData.light().textTheme.copyWith(
              // bodyText1: TextStyle(color: Colors.white),
              // bodyText2: TextStyle(color: Colors.white),
              titleLarge: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amber),
      ),
      home: MyHomePage(),
      routes: {
        CateGrid.namedRoute: (context) => Catmeals(),
        MealItem.routeName: (context) => MealDetails(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => MyHomePage());
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeals'),
      ),
      body: CategoriesScreen(),
    );
  }
}
