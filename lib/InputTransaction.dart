import 'package:flutter/material.dart';

class InputTransaction extends StatelessWidget {
  InputTransaction({super.key});

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
              onPressed: () {
                print(amountController.text);
                print(titleController.text);
              },
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
