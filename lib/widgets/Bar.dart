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
          Container(
            height: 10,
            child: FittedBox(
              child: Text(
                spentAmount.toStringAsFixed(0),
              ),
            ),
          ),
          Stack(children: [
            Container(
              height: 50,
              width: 10,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 243, 241, 241),
              ),
              child: FractionallySizedBox(
                heightFactor: partSpend,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ]),
          Text(day.toString().substring(0, 1)),
        ],
      ),
    );
  }
}
