import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'Bar.dart';
import '../models/Transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  const Chart({super.key, required this.recentTransactions});

  List<Map<String, Object>> get groupedtransactionValues {
    return List.generate(
      7,
      (index) {
        final weekDay = DateTime.now().subtract(
          Duration(
            days: index,
          ),
        );
        double totalSum = 0;

        for (var i = 0; i < recentTransactions.length; i++) {
          if (weekDay.day == recentTransactions[i].date.day) {
            totalSum += recentTransactions[i].amount;
          }
        }

        return {
          'day': DateFormat.E().format(weekDay),
          'amount': totalSum,
        };
      },
    ).reversed.toList();
  }

  double get totalSpendings {
    return groupedtransactionValues.fold(
        0.0, (sum, data) => sum + (data["amount"]! as double));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Card(
        elevation: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...groupedtransactionValues
                .map(
                  (data) => Flexible(
                    fit: FlexFit.tight,
                    child: Bar(
                        day: data["day"],
                        spentAmount: data["amount"] as double,
                        partSpend: totalSpendings != 0
                            ? (data["amount"] as double) / totalSpendings
                            : 0.0),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
