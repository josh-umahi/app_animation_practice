import 'package:flutter/material.dart';

import 'meal_menu/meal_menu_app.dart';
import 'four_way_slideout/four_way_slideout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation Practice',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      // home: FourWaySlideout(),
      home: MealMenuApp(),
    );
  }
}
