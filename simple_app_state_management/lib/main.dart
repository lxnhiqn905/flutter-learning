import 'package:flutter/material.dart';
import 'package:simple_app_state_management/common/theme.dart';
import 'package:simple_app_state_management/screens/cart.dart';
import 'package:simple_app_state_management/screens/catalog.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple app state management',
      theme: myTheme,
      routes: {
        '/': (context) => MyCatalog(),
        '/cart': (context) => MyCart(),
      },
    );
  }
}
