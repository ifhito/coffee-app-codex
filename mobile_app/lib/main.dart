import 'package:flutter/material.dart';

import 'screens/coffee_bean_list_page.dart';

void main() {
  runApp(const CoffeeApp());
}

class CoffeeApp extends StatelessWidget {
  const CoffeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Bean SNS',
      theme: ThemeData(primarySwatch: Colors.brown),
      home: const CoffeeBeanListPage(),
    );
  }
}

