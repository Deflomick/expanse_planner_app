import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
class TransactionList extends StatelessWidget {
final Function deleteTx;
final List<Transaction> transactions;
TransactionList(this.transactions,this.deleteTx);


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
            elevation: 5,
            margin:EdgeInsets.symmetric(
                vertical: 8 ,
                horizontal: 5

            ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child:Padding(
                  padding: EdgeInsets.all(6),
                child: FittedBox(
                  child:Text(
                    '\$${transactions[index].amount}'
                  ),
                ),
              ),
            ),
            title: Text(
              transactions[index].title,
              style: Theme.of(buildContext).textTheme.headline6,
            ),
            subtitle: Text(
              DateFormat.yMMMd().format(transactions[index].dateTime),

            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              color: Theme.of(buildContext).errorColor,
              onPressed: () => deleteTx(transactions[index].id),
            ),
          ),
          );
        },
        itemCount: transactions.length,

      ),

 );
  }
}
