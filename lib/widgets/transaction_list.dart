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


      child: transactions.isEmpty ? Column(children: <Widget>[
        Text('Ancora nessuna Transazione!',
        style: Theme.of(buildContext).textTheme.headline6,
        ),
        SizedBox( //funge da separatore
          height: 10,
        ),
        Container(
          height: 200,
            child:Image.asset(
              'assets/images/waiting.png',
              fit: BoxFit.cover,
            ),
        ),
      ],
      )
          : ListView.builder(
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
                      style: Theme.of(buildContext).textTheme.headline6,
                    ),
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
