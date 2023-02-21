import 'package:expensetracker/widgets/my_home_page.dart';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.purple,
            accentColor: Colors.amber,
          ),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          fontFamily: 'Quicksand'),
      darkTheme: ThemeData.dark(useMaterial3: true),
      home: const MyHomePage(),
    );
  }
}
