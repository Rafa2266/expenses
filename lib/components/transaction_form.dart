import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final void Function(String, double) onSubmit;

  TransactionForm({super.key, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(labelText: 'Título'),
              controller: titleController,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Valor (R\$)'),
              controller: valueController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      final title = titleController.text;
                      final value = double.tryParse(
                              valueController.text.replaceAll(',', '.')) ??
                          0;
                      onSubmit(title, value);
                    },
                    style: TextButton.styleFrom(foregroundColor: Colors.purple),
                    child: const Text('Nova transação')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
