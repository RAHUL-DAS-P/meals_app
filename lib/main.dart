import 'package:flutter/material.dart';
import 'dummy_data.dart';
import 'screens/filters_screen.dart';
import './models/meal.dart';
import 'screens/favourites.dart';
import 'userwidgets/main_drawer.dart';
import 'screens/meal_details_screen.dart';
import 'userwidgets/meal_item.dart';
import 'screens/catagories_screen.dart';
import 'screens/category_meals_screen.dart';
import 'userwidgets/category_grid.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _avaialbleMeals = DUMMY_MEALS;
  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _avaialbleMeals = DUMMY_MEALS.where((meal) {
        if (filterData['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (filterData['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (filterData['vegan'] && !meal.isVegan) {
          return false;
        }
        if (filterData['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

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
        CateGrid.namedRoute: (context) => Catmeals(_avaialbleMeals),
        MealItem.routeName: (context) => MealDetails(),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(_filters, _setFilters),
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
  List<Map<String, Object>> pages = [
    {
      "page": CategoriesScreen(),
      "title": "Categories",
    },
    {
      "page": Favourites(),
      "title": "Favourites",
    },
  ];
  int _selectedPage = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[_selectedPage]["title"]),
      ),
      drawer: MainDrawer(),
      body: pages[_selectedPage]["page"],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.pink,
        unselectedItemColor: Colors.white70,
        selectedItemColor: Colors.white,
        currentIndex: _selectedPage,
        type: BottomNavigationBarType.shifting,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            backgroundColor: Colors.pink,
            label: pages[_selectedPage]["title"],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            backgroundColor: Colors.pink,
            label: pages[_selectedPage]["title"],
          ),
        ],
      ),
    );
  }
}
