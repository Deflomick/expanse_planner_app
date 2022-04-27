import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/new_transaction.dart';
import 'package:flutter_complete_guide/widgets/transaction_list.dart';
import 'widgets/chart.dart';

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
        errorColor: Colors.red,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
          headline6: TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          button: TextStyle(color: Colors.white),
        ),
        appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'Opensans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,

                ),
            ),
        ),
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
    // Transaction(
    //   id: 't1',
    //   title: 'Nuove Scarpe',
    //   dateTime: DateTime.now(),
    //   amount: 69.99,
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'Vino',
    //   dateTime: DateTime.now(),
    //   amount: 16.53,
    // ),

  ];

  List<Transaction> get _recentTransaction{
    return _userTransactions.where((tx) {
      return tx.dateTime.isAfter(
          DateTime.now().subtract(
              Duration(days: 7),
          ),
      );
    }).toList();
  }
  void _addNewTransaction(String txTitle , double txAmount , DateTime chosenDate ) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        dateTime: chosenDate,
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

  void _deleteTransaction(String id){
    setState(() {
      _userTransactions.removeWhere(
          (tx) => tx.id == id
      );

          

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Spese Personali' ,
          /*style: TextStyle(fontFamily: 'Opensans'
          ), stile singolo per un solo testo non è sempre conveniente */
        ),
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
        Chart(_recentTransaction),
            TransactionList(_userTransactions , _deleteTransaction),

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


