import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function newTransactionHandler;
  NewTransaction({super.key, required this.newTransactionHandler});

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Title",
              ),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Amount",
              ),
              controller: amountController,
            ),
            TextButton(
              onPressed: (() {
                newTransactionHandler(
                  txTitle: titleController.text,
                  txAmount: double.parse(amountController.text),
                );
              }),
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
