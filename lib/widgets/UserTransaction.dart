import 'package:flutter/material.dart';
import './TransactionWidget.dart';
import './newTransaction.dart';
import '../models/Transaction.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({super.key});

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
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
    setState(() {
      transactions.add(
        Transaction(
          id: DateTime.now().toString(),
          title: txTitle,
          amount: txAmount,
          date: DateTime.now(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(
          newTransactionHandler: _addNewTransaction,
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
    );
  }
}
