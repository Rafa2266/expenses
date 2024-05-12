import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  TransactionForm({super.key, required this.onSubmit});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  _submitForm() {
    final title = titleController.text;
    final value =
        double.tryParse(valueController.text.replaceAll(',', '.')) ?? 0;
    if (title.isEmpty || value <= 0) {
      return;
    }
    widget.onSubmit(title, value);
  }

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
              onSubmitted: (_) => _submitForm(),
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Valor (R\$)'),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              controller: valueController,
              onSubmitted: (_) => _submitForm(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      _submitForm();
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
