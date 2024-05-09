import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  const TransactionList(this._transactions, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _transactions.map((t) {
        var valuePrice = t.value.toStringAsFixed(2);
        return Card(
            child: Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple, width: 2)),
              padding: const EdgeInsets.all(10),
              child: Text(
                'R\$ $valuePrice',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.purple),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  t.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  DateFormat('d MMM y').format(t.date),
                  style: const TextStyle(
                      color: Color.fromARGB(255, 100, 100, 100)),
                ),
              ],
            )
          ],
        ));
      }).toList(),
    );
  }
}
