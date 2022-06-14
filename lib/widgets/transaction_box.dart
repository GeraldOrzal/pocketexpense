import 'package:flutter/material.dart';
import 'package:pocketexpense/models/transaction.dart';
import 'package:pocketexpense/styles.dart';
import '../constant.dart';
import '../styles.dart';

class TransactionBox extends StatelessWidget {
  Transaction transaction;
  TransactionBox({Key? key, required this.transaction}) : super(key: key);

  IconData? returnCategoryIcon(String category) {
    switch (category) {
      case "Subscription":
        return Icons.subscriptions;
      case "Food":
        return Icons.restaurant;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(transaction.timestamp as String);
    return GestureDetector(
      onTap: () => {
        Navigator.pushNamed(context, transactionRoute, arguments: transaction)
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    decoration: new BoxDecoration(
                        color: Color.fromRGBO(255, 234, 234, 1),
                        borderRadius:
                            new BorderRadius.all(const Radius.circular(6.0))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        " ${dateTime.day} \n ${months[dateTime.month]}  ",
                        style: Theme.of(context).textTheme.headline3?.copyWith(
                            decoration: TextDecoration.none,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Bumili ng Pares",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                            ),
                            Icon(
                              returnCategoryIcon(
                                  transaction.category as String),
                              color: transaction.isExpense
                                  ? Colors.red
                                  : Color.fromRGBO(217, 154, 61, 1),
                            )
                          ]),
                    ),
                  ),
                  Text(
                    (transaction.isExpense ? "-" : "+") +
                        "₱ ${transaction.amount}",
                    style: Theme.of(context).textTheme.headline2?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: transaction.isExpense
                            ? Colors.red
                            : Color.fromRGBO(217, 154, 61, 1)),
                  )
                ],
              ),
            ),
            decoration: new BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, 1),
                    blurRadius: 5,
                  )
                ],
                gradient: new LinearGradient(
                    stops: [0.02, 0.02], colors: [Colors.red, Colors.white]),
                borderRadius:
                    new BorderRadius.all(const Radius.circular(6.0)))),
      ),
    );
  }
}
