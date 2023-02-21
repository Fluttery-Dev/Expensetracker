import 'package:expensetracker/models/Transaction.dart';
import 'package:expensetracker/widgets/newTransaction.dart';
import 'package:flutter/material.dart';

import 'TransactionWidget.dart';
import 'chart.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transactions = [];

  void _addNewTransaction(
      {required DateTime txDate,
      required String txTitle,
      required double txAmount}) {
    transactions.add(
      Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: txDate,
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
            onPressed: () => newTransactionWidget(context),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Chart(
              recentTransactions: transactions
                  .where(
                    (element) => element.date.isAfter(
                        DateTime.now().subtract(const Duration(days: 7))),
                  )
                  .toList(),
            ),
            Container(
              height: 450,
              child: transactions.isEmpty
                  ? Image.asset("assets/images/empty.png")
                  : ListView.builder(
                      itemBuilder: (context, i) => ShowTransaction(
                        transaction: transactions[i],
                        deleteHandler: deleteElement,
                      ),
                      itemCount: transactions.length,
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => newTransactionWidget(context),
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }

  Future<dynamic> newTransactionWidget(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            NewTransaction(newTransactionHandler: _addNewTransaction),
          ],
        );
      },
    );
  }

  void deleteElement(Transaction element) {
    transactions.remove(element);
    setState(() {});
  }
}
