import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transaction_list.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});
  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(
        id: 't1',
        title: 'Novo tênis de corrida',
        value: 315.20,
        date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Novo Headset', value: 245.50, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[TransactionList(_transactions), TransactionForm()],
    );
  }
}
