import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Transaction{
  String id;
  String title;
  double amount;
  DateTime dateTime;

  Transaction({
    @required this.id,
    @required this.title,
    @required this.dateTime,
    @required this.amount
  });

}