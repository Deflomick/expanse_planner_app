import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
class TransactionList extends StatelessWidget {

final List<Transaction> transactions;
TransactionList(this.transactions);

@override
  Widget build(BuildContext buildContext){
 return Container(
   height: 300,


      child: ListView.builder(
        itemBuilder: (ctx,index){
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
                      color: Theme.of(buildContext).primaryColor ,
                      width: 2 ,
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    '\$${transactions[index].amount.toStringAsFixed(2)}', // fixi ogni valore a due decimali
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(buildContext).primaryColor,
                    ),
                  ),
                ),Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget> [
                    Text(transactions[index].title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.green,
                      ),),
                    Text(
                      DateFormat('yyyy-MM-dd').format(transactions[index].dateTime) ,
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
        },
        itemCount: transactions.length,

      ),

 );
  }
}
