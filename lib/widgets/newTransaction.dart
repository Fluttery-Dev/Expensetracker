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
              onEditingComplete: addTransaction,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Amount",
              ),
              controller: amountController,
              keyboardType: TextInputType.number,
              onEditingComplete: addTransaction,
            ),
            TextButton(
              onPressed: (addTransaction),
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }

  addTransaction() {
    if (double.parse(amountController.text) < 0) {
      return;
    }
    newTransactionHandler(
      txTitle: titleController.text,
      txAmount: double.parse(amountController.text),
    );
  }
}
