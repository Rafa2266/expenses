import 'package:expenses/components/transaction_item.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  final void Function(String) onDelete;
  const TransactionList(this._transactions, this.onDelete, {super.key});

  @override
  Widget build(BuildContext context) {
    return _transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                SizedBox(height: constraints.maxHeight * 0.05),
                Text(
                  'Nenhuma Transação Cadastrada !!!',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: constraints.maxHeight * 0.05),
                SizedBox(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            );
          })
        : ListView.builder(
            itemCount: _transactions.length,
            itemBuilder: (ctx, index) {
              final t = _transactions[index];

              return TransactionItem(t: t, onDelete: onDelete);
            },
          );
  }
}
