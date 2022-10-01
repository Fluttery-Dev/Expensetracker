import 'package:expensetracker/models/Transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ShowTransaction extends StatelessWidget {
  final Transaction transaction;
  final Function deleteHandler;

  const ShowTransaction(
      {super.key, required this.transaction, required this.deleteHandler});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
              padding: EdgeInsets.all(5),
              child: FittedBox(
                  child: Text(transaction.amount.toStringAsFixed(2)))),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transaction.date),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Theme.of(context).errorColor),
          onPressed: () {},
        ),
      ),
    );
  }
}
