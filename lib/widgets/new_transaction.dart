
import 'adaptive_button.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/adaptive_button.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

@override
_NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction>{
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  DateTime _selectDate;

  void _submitData() {
    if (_amountController.text.isEmpty){
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount= double.parse(_amountController.text);
    if(enteredTitle.isEmpty || enteredAmount <=0 || _selectDate == null){
      return; //si blocca se non soddisfa l' if
    }
    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectDate,
    );
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectDate = pickedDate;
      });
    });
    print('...');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
          bottom: MediaQuery.of(context).viewInsets.bottom + 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            /*CupertinoTextField(
              placeholder: ,
            ),*/
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: _titleController,
              onSubmitted: (_) => _submitData,
              // onChanged: (value) {
              //titleInput=value;
              //},
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData, //anonym function
              //onChanged: (value) => amountInput = value, //short
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      _selectDate == null
                          ? 'Nessuna data selezionata'
                          : 'Seleziona una data: ${DateFormat.yMd().format(_selectDate)}',
                  ),
                  ),
                  AdaptiveFlatButton(
                      'Scegli una data',
                      _presentDatePicker,
                  )

                ],
              ),
            ),
            RaisedButton(
                onPressed: _submitData,
              child: Text('Aggiungi Transazione'),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).buttonColor,
            )


          ],
        ),
      ),
    );
  }

}