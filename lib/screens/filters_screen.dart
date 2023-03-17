import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:flutter_complete_guide/userwidgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  final Function saveFilters;
  final Map<String, bool> filters;

  FiltersScreen(this.filters, this.saveFilters);

  static const routeName = "/filters";

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFree = false;
  var _isLactoseFree = false;
  var _isVegan = false;
  var _isVegetarian = false;

  @override
  void initState() {
    _isGlutenFree = widget.filters['gluten'];
    _isLactoseFree = widget.filters['lactose'];
    _isVegan = widget.filters['vegan'];
    _isVegetarian = widget.filters['vegetarian'];
    super.initState();
  }

  Widget BuildSwitchListView(
      String title, String des, var currentValue, Function change) {
    return SwitchListTile(
      value: currentValue,
      onChanged: change,
      title: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(des),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: [
          IconButton(
            onPressed: () {
              Map<String, bool> filtered = {
                'gluten': _isGlutenFree,
                'lactose': _isLactoseFree,
                'vegan': _isVegan,
                'vegetarian': _isVegetarian
              };
              widget.saveFilters(filtered);
            },
            icon: Icon(Icons.save),
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              "Select your preferences !!",
              style: TextStyle(
                color: Colors.pink,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 300,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 255, 0, 85),
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: Expanded(
                child: ListView(
                  children: [
                    BuildSwitchListView(
                      "Gluten-Free",
                      "only include gluten free meal",
                      _isGlutenFree,
                      (newvalue) {
                        setState(
                          () {
                            _isGlutenFree = newvalue;
                          },
                        );
                      },
                    ),
                    BuildSwitchListView(
                      "Lactose-Free",
                      "only include lactose free meal",
                      _isLactoseFree,
                      (newvalue) {
                        setState(
                          () {
                            _isLactoseFree = newvalue;
                          },
                        );
                      },
                    ),
                    BuildSwitchListView(
                      "Vegan",
                      "only include Vegan meal",
                      _isVegan,
                      (newvalue) {
                        setState(
                          () {
                            _isVegan = newvalue;
                          },
                        );
                      },
                    ),
                    BuildSwitchListView(
                      "Vegetarian",
                      "only include vegetarian meal",
                      _isVegetarian,
                      (newvalue) {
                        setState(
                          () {
                            _isVegetarian = newvalue;
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
