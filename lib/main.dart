import 'package:expenses/components/transaction_user.dart';
import 'package:flutter/material.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Despesas pessoais")),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const <Widget>[
            SizedBox(
              child: Card(
                  color: Colors.blue, elevation: 5, child: Text('Gráfico')),
            ),
            TransactionUser()
          ],
        ));
  }
}
