import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_complete_guide/widgets/new_transaction.dart';
import 'package:flutter_complete_guide/widgets/transaction_list.dart';
import 'widgets/chart.dart';

import 'models/transaction.dart';




void main() {
  /* WidgetsFlutterBinding.ensureInitialized();
 SystemChrome.setPreferredOrientations([
   DeviceOrientation.portraitUp,
   DeviceOrientation.portraitDown,
 ]); Vieta l utilizzo nel girare il dispositivo */
 runApp(MyApp());

}


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

  bool _showChart = false ;


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
    final mediaQuery = MediaQuery.of(context);
    final isLandscape =mediaQuery.orientation == Orientation.landscape;
    final PreferredSizeWidget appBar = Platform.isIOS ? CupertinoNavigationBar(
      middle: Text(
        'Spese Personali' ,
        ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          GestureDetector(
            onTap: () => _startAddNewTransaction(context),
            child: Icon(CupertinoIcons.add),
          ),
        ],
      ),

    ) :AppBar(
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
    );

    final txListWidget = Container(
      height: ((mediaQuery).size.height - appBar.preferredSize.height
          -mediaQuery.padding.top)
          * 0.7,
      child: TransactionList(_userTransactions , _deleteTransaction),
    );
    final pageBody = SafeArea(
    child:SingleChildScrollView(
      child: Column(


        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:<Widget>[
          if (isLandscape) Row( // if consentito durante una lista
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Text(
                'Visualizza Grafico',
              style: Theme.of(context).textTheme.headline6,
              ),
              Switch.adaptive(
                activeColor: Theme.of(context).accentColor,
                value: _showChart,
                onChanged: (val) {
                  _showChart = val;
                },
              ),
            ],),
          if(!isLandscape) Container(
            height: ((mediaQuery).size.height - appBar.preferredSize.height
                -mediaQuery.padding.top)
                * 0.3,
            child: Chart(_recentTransaction),
          ),
          if(!isLandscape) txListWidget ,
          if(isLandscape)_showChart ?
          Container(
            height: ((mediaQuery).size.height - appBar.preferredSize.height
                -mediaQuery.padding.top)
                * 0.7,
            child: Chart(_recentTransaction),
          ) : txListWidget


        ],
      ),
    ),
    );

    return Platform.isIOS ? CupertinoPageScaffold(
        child: pageBody,
            navigationBar: appBar ,
    ) : Scaffold(
      appBar: appBar,
      body:  pageBody,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Platform.isIOS ? Container(


      ) : FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );


    }

  }


