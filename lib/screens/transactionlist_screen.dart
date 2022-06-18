import 'package:flutter/material.dart';
import 'package:pocketexpense/models/transaction.dart';
import 'package:pocketexpense/widgets/bottomrowitems.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pocketexpense/widgets/foodcategoryfilter.dart';
import 'package:provider/provider.dart';
import 'package:pocketexpense/widgets/topbar_nav.dart';

import '../constant.dart';
import '../providers/transactionsprovider.dart';
import '../widgets/filter.dart';
import '../widgets/transaction_box.dart';

class TransactionListScreen extends StatefulWidget {
  TransactionListScreen({Key? key}) : super(key: key);

  @override
  State<TransactionListScreen> createState() => _TransactionListScreenState();
}

class _TransactionListScreenState extends State<TransactionListScreen> {
  String transactionTypeFilter = "";
  String orderingFilter = "";
  List<String> foodCategory = [];
  int? currentMonth;
  void _onChanged(data) {
    setState(() {
      currentMonth = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<TransactionBox> list = [];
    print(foodCategory);
    List<Transaction> tempList =
        context.watch<TransactionsProvider>().allTransactions;

    List<TransactionBox> renderAllTransactions() {
      print(orderingFilter);
      if (orderingFilter.isEmpty &&
          transactionTypeFilter.isEmpty &&
          foodCategory.isEmpty &&
          currentMonth == null) {
        for (var i = 0; i < tempList.length; i++) {
          list.add(TransactionBox(transaction: tempList[i]));
        }
        return list;
      } else {
        List<Transaction> newList = [];
        if (newList.isEmpty) {
          newList = tempList;
        }
        if (currentMonth != null) {
          newList = newList
              .where((element) =>
                  DateTime.parse(element.timestamp as String).month ==
                  currentMonth)
              .toList();
        }
        if (transactionTypeFilter.isNotEmpty) {
          newList = newList
              .where(
                  (element) => element.transactionType == transactionTypeFilter)
              .toList();
        }

        if (orderingFilter.isNotEmpty) {
          if (orderingFilter == "Highest") {
            newList.sort((b, a) => a.amount.compareTo(b.amount));
          } else {
            newList.sort((a, b) => a.amount.compareTo(b.amount));
          }
        }
        if (foodCategory.isNotEmpty) {
          newList = newList
              .where((element) => foodCategory.contains(element.category))
              .toList();
        }

        newList.forEach((element) {
          list.add(TransactionBox(transaction: element));
        });
      }

      return list;
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : Colors.black12,
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
                value: currentMonth,
                items: const [
                  DropdownMenuItem(
                      value: 0,
                      child: Text(
                        "January",
                      )),
                  DropdownMenuItem(value: 1, child: Text("February")),
                  DropdownMenuItem(value: 2, child: Text("March")),
                  DropdownMenuItem(value: 3, child: Text("April")),
                  DropdownMenuItem(value: 4, child: Text("May")),
                  DropdownMenuItem(value: 5, child: Text("June")),
                  DropdownMenuItem(value: 6, child: Text("July")),
                  DropdownMenuItem(value: 7, child: Text("August")),
                  DropdownMenuItem(value: 8, child: Text("September")),
                  DropdownMenuItem(value: 9, child: Text("October")),
                  DropdownMenuItem(value: 10, child: Text("November")),
                  DropdownMenuItem(value: 11, child: Text("December")),
                ],
                onChanged: _onChanged,
              ),
            ),
            GestureDetector(
              onTap: () => {
                showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext builder) {
                      List<String> tempCategoryFilterList = [];
                      String tempTransactionFilter = "";
                      String temporderFilter = "";
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
                                        onTap: () {
                                          setState(() {
                                            transactionTypeFilter = "";
                                            currentMonth = null;
                                            orderingFilter = "";
                                            foodCategory = [];
                                          });
                                          Navigator.pop(context);
                                        },
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
                                FilterRow(
                                  filterEntry: <TextFilterEntry>[
                                    TextFilterEntry("Expense"),
                                    TextFilterEntry("Income"),
                                  ],
                                  singleSelectedData: transactionTypeFilter,
                                  callBack: (data) {
                                    tempTransactionFilter = data;
                                  },
                                  allowMultipleSelected: false,
                                ),
                                Text("Sort By"),
                                FilterRow(
                                  callBack: (data) {
                                    temporderFilter = data;
                                  },
                                  singleSelectedData: orderingFilter,
                                  filterEntry: <TextFilterEntry>[
                                    TextFilterEntry("Highest"),
                                    TextFilterEntry("Lowest"),
                                  ],
                                  allowMultipleSelected: false,
                                ),
                                Text("Category"),
                                FoodCategoryFilter(
                                  callBack: (data) {
                                    tempCategoryFilterList = data;
                                  },
                                  initialData: foodCategory,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        transactionTypeFilter =
                                            tempTransactionFilter;
                                        orderingFilter = temporderFilter;
                                        foodCategory = tempCategoryFilterList;
                                      });
                                    },
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
                color: primary,
                size: 32,
              ),
            )
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 40.0),
        children: renderAllTransactions(),
      ),
    );
  }
}
