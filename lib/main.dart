import 'package:flutter/material.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(id: 't1',
        title: 'New Shoes ',
        dateTime: DateTime.now(),
        amount: 69.99),
    Transaction(id: 't2',
        title: 'Weekly Groceries ',
        dateTime: DateTime.now(),
        amount: 15.99),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:<Widget>[
          Container(
            width: double.infinity,
             child: Card(
              color: Colors.blue,
              child: Text('Chart!'),
               elevation: 5,
            ),

          ),
          Column(children: transactions.map((tx) {
            return Card(
              child: Text(tx.title),
            );

          }).toList(),)

          ],),
        ],
      ),
    );
  }
}
