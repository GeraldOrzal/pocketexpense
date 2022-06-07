import 'package:flutter/material.dart';

import 'package:pocketexpense/widgets/topbar_nav.dart';

import '../widgets/transaction_box.dart';

class TransactionListScreen extends StatefulWidget {
  TransactionListScreen({Key? key}) : super(key: key);

  @override
  State<TransactionListScreen> createState() => _TransactionListScreenState();
}

class _TransactionListScreenState extends State<TransactionListScreen> {
  void _onChanged(data) {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 10,
                top: 0,
                bottom: 0,
                right: 0,
              ),
              child: DropdownButton(
                style: Theme.of(context).textTheme.bodyText2,
                hint: const Text("Month"),
                items: const [
                  DropdownMenuItem(
                      value: 1,
                      child: Text(
                        "January",
                      )),
                  DropdownMenuItem(value: 2, child: Text("February")),
                  DropdownMenuItem(value: 3, child: Text("March")),
                  DropdownMenuItem(value: 4, child: Text("April")),
                  DropdownMenuItem(value: 5, child: Text("May")),
                  DropdownMenuItem(value: 6, child: Text("June")),
                  DropdownMenuItem(value: 7, child: Text("July")),
                  DropdownMenuItem(value: 8, child: Text("August")),
                  DropdownMenuItem(value: 9, child: Text("September")),
                  DropdownMenuItem(value: 10, child: Text("October")),
                  DropdownMenuItem(value: 11, child: Text("November")),
                  DropdownMenuItem(value: 12, child: Text("December")),
                ],
                onChanged: _onChanged,
              ),
            ),
            GestureDetector(
              onTap: () => {
                showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext builder) {
                      return DraggableScrollableSheet(
                          snap: true,
                          initialChildSize: 1,
                          builder: (context, scrollController) {
                            return SingleChildScrollView(
                                child: Column(
                              children: const [Text("Filter Transaction")],
                            ));
                          });
                    })
              },
              child: const Icon(
                Icons.notifications,
                size: 32,
              ),
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          TransactionBox(isExpense: true),
          TransactionBox(isExpense: true),
          TransactionBox(isExpense: true),
          TransactionBox(isExpense: true),
          TransactionBox(isExpense: true),
          TransactionBox(isExpense: true),
          TransactionBox(isExpense: true),
          TransactionBox(isExpense: true),
          TransactionBox(isExpense: true),
          TransactionBox(isExpense: true),
          TransactionBox(isExpense: true),
          TransactionBox(isExpense: true),
          TransactionBox(isExpense: true),
          TransactionBox(isExpense: true),
          TransactionBox(isExpense: true),
        ],
      ),
    );
  }
}
