import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTx,
    @required this.duplicateTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;
  final Function duplicateTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text('\$${transaction.amount}'),
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transaction.date),
        ),
        trailing: Wrap(
          spacing: -10,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Theme.of(context).errorColor,
              ),
              onPressed: () => deleteTx(
                transaction.id,
              ),
            ),
            IconButton(
              onPressed: () => duplicateTx(
                transaction.id,
                transaction.amount,
                transaction.title,
                transaction.date,
              ),
              icon: const Icon(
                Icons.copy,
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
