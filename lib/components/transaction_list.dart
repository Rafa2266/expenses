import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  const TransactionList(this._transactions, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: _transactions.isEmpty
          ? Column(
              children: <Widget>[
                const SizedBox(height: 20),
                Text(
                  'Nenhuma Transação Cadastrada !!!',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemCount: _transactions.length,
              itemBuilder: (ctx, index) {
                final t = _transactions[index];
                var valuePrice = t.value.toStringAsFixed(2);
                return Card(
                    child: Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).colorScheme.primary,
                              width: 2)),
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'R\$ $valuePrice',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(t.title,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge /*  const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ), */
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
              },
            ),
    );
  }
}
