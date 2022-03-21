import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

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

  //String titleInput;
  //String amountInput;
  final titleController = TextEditingController();
  final amountController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
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
          Card(
            elevation: 5,
            child:Container(
              padding: EdgeInsets.all(10),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                   controller: titleController,
                   // onChanged: (value) {
                    //titleInput=value;
                    //},
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                    controller: amountController,
                    //onChanged: (value) => amountInput = value, //short
                  ),
                  FlatButton(
                    onPressed: () {

                    },
                    child: Text('Add Transaction'),
                    textColor: Colors.purple,
                  ),
          ],
          ),
          ),
          ),
          Column(children: transactions.map((tx) {
            return Card(
              child: Row(
                children: <Widget> [
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                    border:Border.all(
                    color: Colors.purple ,
                    width: 2 ,
                  ),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text(
                 '\$${tx.amount}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.purple,
                    ),
                ),
                ),Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      Text(tx.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.green,
                          ),),
                      Text(
                        DateFormat('yyyy-MM-dd').format(tx.dateTime) ,
                        style: TextStyle(
                        fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.red,
                      ),
                      ),
                  ],),
              ],
              ),
            );

          }).toList(),)

          ],),
    );


  }
}
