import 'package:flutter/material.dart';
import 'package:pocketexpense/widgets/bottomrowitems.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:pocketexpense/widgets/topbar_nav.dart';

import '../constant.dart';
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
        elevation: 0,
        backgroundColor: Colors.white,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(child: Icon(Icons.drag_handle_rounded)),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Filter Transaction"),
                                      GestureDetector(
                                        onTap: () => {},
                                        child: Container(
                                          decoration: const BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 238, 121, 113),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20.0))),
                                          child: const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              "Reset",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 252, 18, 1)),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Text("Filter By"),
                                BottomRowItems(),
                                Text("Sort By"),
                                BottomRowItems(),
                                Text("Category"),
                                Row(
                                  children: [
                                    Expanded(child: Text("Choose Category")),
                                    GestureDetector(
                                      onTap: () => {
                                        showModalBottomSheet<void>(
                                            context: context,
                                            builder: (BuildContext builder) {
                                              return DraggableScrollableSheet(
                                                  builder: (context,
                                                      scrollController) {
                                                return SingleChildScrollView(
                                                  child: Container(
                                                      child: Text("FOOD")),
                                                );
                                              });
                                            })
                                      },
                                      child: Container(
                                          child: Row(
                                        children: [
                                          Text("0 selected"),
                                          Icon(Icons.arrow_right)
                                        ],
                                      )),
                                    )
                                  ],
                                ),
                                ElevatedButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Apply",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                              color: background,
                                              fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ));
                          });
                    })
              },
              child: const Icon(
                Icons.filter_list,
                size: 32,
              ),
            )
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 40.0),
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
