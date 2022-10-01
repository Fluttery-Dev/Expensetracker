import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  final spentAmount;
  final partSpend;
  final day;

  const Bar(
      {super.key,
      required this.day,
      required this.spentAmount,
      required this.partSpend});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          FittedBox(child: Text(spentAmount.toStringAsFixed(0))),
          Container(
            height: 50,
            width: 10,
            margin: EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(10),
              color: Color.fromARGB(255, 243, 241, 241),
            ),
            child: FractionallySizedBox(
              heightFactor: partSpend,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          Text(day.toString().substring(0, 1)),
        ],
      ),
    );
  }
}
