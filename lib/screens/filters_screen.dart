import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({Key key}) : super(key: key);

  static const routeName = "/filters";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("filters")),
    );
  }
}
