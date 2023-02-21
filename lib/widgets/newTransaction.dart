import 'dart:ffi';

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
        padding: EdgeInsets.only(
            left: 10,
            right: 10,
            top: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: "Title",
              ),
              controller: titleController,
              textInputAction: TextInputAction.next,
            ),
            TextField(
                decoration: const InputDecoration(
                  labelText: "Amount",
                ),
                controller: amountController,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                onSubmitted: ((value) => _openDate())),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  Expanded(
                    child: Text(_chosenDate == null
                        ? "No Date Currently"
                        : "Chosen Date : ${DateFormat.yMd().format(_chosenDate!)}"),
                  ),
                  TextButton(
                    onPressed: _openDate,
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

  _openDate() {
    showDatePicker(
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
    );
  }
}
