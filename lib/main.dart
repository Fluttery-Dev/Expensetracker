import './widgets/UserTransaction.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("Expense Tracker"),
          ),
        ),
        body: Column(
          children: [
            Card(
              color: Colors.blue,
              child: Container(
                width: double.infinity,
                child: const Center(
                  child: Text("Expense chart"),
                ),
              ),
            ),
            UserTransaction(),
          ],
        ),
      ),
    );
  }
}
