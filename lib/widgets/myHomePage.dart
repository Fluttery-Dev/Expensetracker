import 'package:expensetracker/models/Transaction.dart';
import 'package:expensetracker/widgets/newTransaction.dart';
import 'package:flutter/material.dart';

import 'TransactionWidget.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transactions = [
    Transaction(
      id: "T1",
      title: "Purchased Smart Watch",
      amount: 1000,
      date: DateTime.now(),
    ),
    Transaction(
        id: "T2", title: "Condenser Mic", amount: 5000, date: DateTime.now()),
  ];

  void _addNewTransaction({required String txTitle, required double txAmount}) {
    transactions.add(
      Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now(),
      ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Expense Tracker"),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (ctx) {
                  return NewTransaction(
                      newTransactionHandler: _addNewTransaction);
                },
              );
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
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
            Container(
              height: 300,
              child: ListView.builder(
                itemBuilder: (context, i) => ShowTransaction(
                  transaction: transactions[i],
                ),
                itemCount: transactions.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
