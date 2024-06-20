import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class AdaptativeDatePicker extends StatelessWidget {
  final DateTime selectDate;
  final Function(DateTime) onDateChanged;

  _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      } else {
        onDateChanged(pickedDate);
      }
    });
  }

  const AdaptativeDatePicker(
      {required this.selectDate, required this.onDateChanged, super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? SizedBox(
            height: 180,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime.now(),
              minimumDate: DateTime(2000),
              maximumDate: DateTime.now(),
              onDateTimeChanged: onDateChanged,
            ),
          )
        : SizedBox(
            height: 70,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(selectDate == null
                      ? 'Nenhuma data selecionada!'
                      : "Data Selecionada: ${DateFormat('dd/MM/yyyy').format(selectDate)}"),
                ),
                TextButton(
                  onPressed: () => _showDatePicker(context),
                  style: TextButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.primary),
                  child: const Text(
                    'Selecionar data',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          );
  }
}
