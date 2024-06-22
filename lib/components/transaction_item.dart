import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key,
    required this.t,
    required this.onDelete,
  });

  final Transaction t;
  final void Function(String p1) onDelete;

  @override
  Widget build(BuildContext context) {
    var valuePrice = t.value.toStringAsFixed(2);
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: FittedBox(
              child: Text(
                'R\$ $valuePrice',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        title: Text(
          t.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(
          DateFormat('d MMM y').format(t.date),
          style: const TextStyle(
            color: Color.fromARGB(255, 100, 100, 100),
          ),
        ),
        trailing: MediaQuery.of(context).size.width > 480
            ? TextButton.icon(
                onPressed: () {
                  onDelete(t.id);
                },
                icon: const Icon(Icons.delete),
                label: const Text('Excluir'),
                style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.error),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  onDelete(t.id);
                },
                color: Theme.of(context).colorScheme.error,
              ),
      ),
    );
  }
}
