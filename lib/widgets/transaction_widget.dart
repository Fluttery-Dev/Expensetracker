import 'package:expensetracker/models/transaction_model.dart';
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
              padding: const EdgeInsets.all(5),
              child: FittedBox(
                  child: Text(transaction.amount.toStringAsFixed(2)))),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width >= 460
            ? TextButton.icon(
                onPressed: () => deleteHandler(transaction),
                icon: const Icon(Icons.delete),
                label: const Text("Delete"),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).colorScheme.error),
                ))
            : IconButton(
                icon: Icon(Icons.delete,
                    color: Theme.of(context).colorScheme.error),
                onPressed: () => deleteHandler(transaction),
              ),
      ),
    );
  }
}
