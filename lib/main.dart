import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
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
    return Scaffold(
        appBar: AppBar(title: const Text("Despesas pessoais")),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            const SizedBox(
              child: Card(
                  color: Colors.blue, elevation: 5, child: Text('Gráfico')),
            ),
            Column(
              children: _transactions.map((t) {
                var value = t.value.toStringAsFixed(2);
                return Card(
                    child: Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple, width: 2)),
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        '\$$value',
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
                          t.date.toString(),
                          style: const TextStyle(
                              color: Color.fromARGB(255, 100, 100, 100)),
                        ),
                      ],
                    )
                  ],
                ));
              }).toList(),
            )
          ],
        ));
  }
}
