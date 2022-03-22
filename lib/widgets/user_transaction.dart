import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/new_transaction.dart';
import 'package:flutter_complete_guide/widgets/transaction_list.dart';

import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {

  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransactions>{

  final List<Transaction> _userTransactions =[
    Transaction(
      id: 't1',
      title: 'New Shoes',
      dateTime: DateTime.now(),
      amount: 69.99,
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      dateTime: DateTime.now(),
      amount: 16.53,
    ),

  ];
  void _addNewTransaction(String txTitle , double txAmount ){
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        dateTime: DateTime.now(),
        amount: txAmount
    );
    setState(() {
      _userTransactions.add(newTx);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(

      children: <Widget> [
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],

    );
  }
}
