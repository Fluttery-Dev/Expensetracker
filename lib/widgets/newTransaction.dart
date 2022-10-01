import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function newTransactionHandler;

  NewTransaction({super.key, required this.newTransactionHandler});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  late DateTime? _chosenDate = null;

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
              decoration: const InputDecoration(
                labelText: "Title",
              ),
              controller: titleController,
              onEditingComplete: addTransaction,
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: "Amount",
              ),
              controller: amountController,
              keyboardType: TextInputType.number,
              onEditingComplete: addTransaction,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  Expanded(
                    child: Text(_chosenDate == null
                        ? "No Date Currently"
                        : "Chosen Date : ${DateFormat.yMd().format(_chosenDate!)}"),
                  ),
                  TextButton(
                    onPressed: () => showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2003),
                      lastDate: DateTime(2025),
                    ).then(
                      (value) {
                        if (value == null) {
                          return;
                        }
                        setState(() {});
                        _chosenDate = value;
                      },
                    ),
                    child: const Text(
                      "Pick Date",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: addTransaction,
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
    widget.newTransactionHandler(
      txTitle: titleController.text,
      txAmount: double.parse(amountController.text),
      txDate: _chosenDate,
    );

    Navigator.of(context).pop();
  }
}
