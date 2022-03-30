import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/chart_bar.dart';

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

      // print(DateFormat.E().format(weekDay));
      // print(totalSum);

      return {
        'day':DateFormat.E().format(weekDay).substring(0, 1),
        'amount':totalSum,
      };
    });
  }

  double get totalSpending{
    return groupedTransactionsValues.fold(0.0,(sum , item ) {
        return sum+item['amount'];
    });
  }


  @override
  Widget build(BuildContext context) {
    // print(groupedTransactionsValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child:Padding(
        padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: groupedTransactionsValues.map((data){
        return Flexible(

          fit: FlexFit.tight,
            child: ChartBar(
              data['day'],
              data['amount'],
              totalSpending == 0.0 ? 0.0 : (data['amount'] as double) / totalSpending,
          ),
        );
    }).toList(),
      ),
    ),
    );
  }
}
