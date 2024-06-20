import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'adaptative_button.dart';
import 'adaptative_text_field.dart';
import 'adaptative_date_picker.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  const TransactionForm({super.key, required this.onSubmit});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  dynamic _selectDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;
    final value =
        double.tryParse(_valueController.text.replaceAll(',', '.')) ?? 0;
    if (title.isEmpty || value <= 0 || _selectDate == null) {
      return;
    }
    widget.onSubmit(title, value, _selectDate);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
              top: 10,
              right: 10,
              left: 10,
              bottom: 10 + MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            children: <Widget>[
              AdaptativeTextField(
                  _titleController, TextInputType.text, _submitForm, 'Título'),
              AdaptativeTextField(
                  _valueController,
                  const TextInputType.numberWithOptions(decimal: true),
                  _submitForm,
                  'Valor (R\$)'),
              AdaptativeDatePicker(
                selectDate: _selectDate,
                onDateChanged: (pickedDate) {
                  setState(() {
                    _selectDate = pickedDate;
                  });
                },
              ),
              /* SizedBox(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(_selectDate == null
                          ? 'Nenhuma data selecionada!'
                          : "Data Selecionada: ${DateFormat('dd/MM/yyyy').format(_selectDate)}"),
                    ),
                    TextButton(
                      onPressed: _showDatePicker,
                      style: TextButton.styleFrom(
                          foregroundColor:
                              Theme.of(context).colorScheme.primary),
                      child: const Text(
                        'Selecionar data',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ), */
              SizedBox(
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AdaptativeButton(
                        label: 'Nova transação',
                        onPressed: () {
                          _submitForm();
                        })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
