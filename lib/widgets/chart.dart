import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'package:intl/intl.dart';
class Chart extends StatelessWidget {

  final List<Transaction> recentTransaction ;
  Chart(this.recentTransaction);

  List<Map<String, Object>> get groupedTransactionsValues{
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index),);
      var totalSum = 0.0;

      for(var i = 0 ; i < recentTransaction.length; i++){

        if(recentTransaction[i].dateTime.day == weekDay.day &&
            recentTransaction[i].dateTime.month ==weekDay.month &&
              recentTransaction[i].dateTime.year == weekDay.year) {
              totalSum += recentTransaction[i].amount;
        }
      }

      print(DateFormat.E(weekDay));
      print(totalSum);

      return {
        'day':DateFormat.E(weekDay),
        'amount':totalSum};
    });
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
      children: <Widget>[
        
      ],
      ),
    );
  }
}
