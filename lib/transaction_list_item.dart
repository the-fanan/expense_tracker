import 'package:flutter/material.dart';
import './transaction.dart';

class TransactionListItem extends StatelessWidget {
  final Transaction transaction;
  TransactionListItem({this.transaction});

  @override 
  Widget build(BuildContext context) 
  {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Card(
        elevation: 4,
        child: Row(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              padding: EdgeInsets.all(10),
              child: Text(this.transaction.amount.toString(), style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(this.transaction.title),
                  Text(this.transaction.date.toString()),
                ]
              )
            ),
          ]
        ),
      )
    );
  }
}