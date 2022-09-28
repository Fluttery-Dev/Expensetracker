import 'package:expensetracker/models/Transaction.dart';
import 'package:flutter/material.dart';
import 'widgets/transactionList.dart';
import 'widgets/newTransaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  List<Transaction> transactions = [
    Transaction(
      id: "T1",
      title: "Purchased Smart Watch",
      amount: 1000,
      date: DateTime.now(),
    ),
    Transaction(
        id: "T2", title: "Condenser Mic", amount: 5000, date: DateTime.now()),
  ];

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
            Column(children: [
              ...transactions
                  .map(
                    (transaction) => transactionList(transaction: transaction),
                  )
                  .toList(),
              NewTransaction(),
            ])
          ],
        ),
      ),
    );
  }
}
