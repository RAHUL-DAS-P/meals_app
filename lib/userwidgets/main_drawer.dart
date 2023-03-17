import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  Widget buildListTile(String title, IconData i, Function navi) {
    return ListTile(
      leading: Icon(
        i,
        size: 25,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: navi,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(5),
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.amber,
              border: Border.all(
                width: 10,
                color: Color.fromARGB(255, 250, 90, 143),
              ),
            ),
            child: Text(
              "Let'S Cook",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w900,
                color: Colors.pink,
              ),
            ),
          ),
          buildListTile(
            "Meals",
            Icons.restaurant_menu,
            () {
              Navigator.pushReplacementNamed(context, "/");
            },
          ),
          buildListTile(
            "Filters",
            Icons.settings,
            () {
              Navigator.pushReplacementNamed(context, FiltersScreen.routeName);
            },
          )
        ],
      ),
    );
  }
}
