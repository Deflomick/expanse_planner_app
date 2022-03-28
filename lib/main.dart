import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/new_transaction.dart';
import 'package:flutter_complete_guide/widgets/transaction_list.dart';

import 'models/transaction.dart';




void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spese Personali',
      theme: ThemeData(
        primarySwatch: Colors.purple ,
        accentColor: Colors.amber,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // String titleInput;
  // String amountInput;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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
  void _addNewTransaction(String txTitle , double txAmount ) {
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

  void _startAddNewTransaction(BuildContext ctx){
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
              onTap: (){},
              child:NewTransaction(_addNewTransaction),
              behavior: HitTestBehavior.opaque,
          );
        }
    );

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spese Personali'),
        actions: <Widget>[
          IconButton(
              onPressed: () => _startAddNewTransaction(context),
              icon: Icon(Icons.add),
          ),
        ],
      ),
      body:  SingleChildScrollView(
        child: Column(


          //mainAxisAlignment: MainAxisAlignment.start,
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
            TransactionList(_userTransactions),

      ],
    ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );


    }

  }


