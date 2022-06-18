import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pocketexpense/constant.dart';
import 'package:pocketexpense/models/transaction.dart';
import 'package:pocketexpense/styles.dart';
import 'package:pocketexpense/widgets/transaction_box.dart';
import 'package:provider/provider.dart';

import '../helpers/TextFormatter.dart';
import '../models/account.dart';
import '../providers/transactionsprovider.dart';

class AccountDetails extends StatefulWidget {
  final Account account;
  AccountDetails({Key? key, required this.account}) : super(key: key);

  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  late Account selectedAccount;
  @override
  void initState() {
    // TODO: implement initState

    selectedAccount = widget.account;
  }

  @override
  Widget build(BuildContext context) {
    List<Transaction> allTransactions =
        context.watch<TransactionsProvider>().allTransactions;
    Size size = MediaQuery.of(context).size;
    DateTime now = DateTime.now();
    List<TransactionBox> renderTransactionBox(String when) {
      List<TransactionBox> tempList = [];
      List<Transaction> list = [];
      if (when == "Today") {
        list = allTransactions
            .where((element) =>
                element.accountID == selectedAccount.accountID &&
                DateTime.parse(element.timestamp as String).month ==
                    now.month &&
                DateTime.parse(element.timestamp as String).year == now.year &&
                DateTime.parse(element.timestamp as String).day == now.day)
            .toList();
      } else {
        list = allTransactions
            .where((element) =>
                element.accountID == selectedAccount.accountID &&
                DateTime.parse(element.timestamp as String).month ==
                    now.month &&
                DateTime.parse(element.timestamp as String).year == now.year &&
                DateTime.parse(element.timestamp as String).day == now.day - 1)
            .toList();
      }

      for (var i = 0; i < list.length; i++) {
        tempList.add(TransactionBox(transaction: list[i]));
      }
      return tempList;
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: background,
          backgroundColor: transfer,
          elevation: 0,
          centerTitle: true,
          title: Text("Account Details",
              style: Theme.of(context)
                  .textTheme
                  .headline2
                  ?.copyWith(color: background)),
          actions: [
            IconButton(
                onPressed: () => {
                      Navigator.pushNamed(context, accountEditRoute,
                          arguments: selectedAccount)
                    },
                icon: const Icon(MdiIcons.pencil)),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 0,
                top: 0,
                bottom: 0,
                right: 0,
              ),
              height: size.height * 0.3,
              decoration: const BoxDecoration(
                color: transfer,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 241, 241, 250),
                            borderRadius:
                                BorderRadius.all(Radius.circular(6.0))),
                        child: const Icon(
                          MdiIcons.wallet,
                          color: transfer,
                          size: 45,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: Text(
                      '₱ ${TextFormatter.formatNumber(selectedAccount.amount)}',
                      style: TxtStyle.getAmountTxt,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Today", style: Theme.of(context).textTheme.headline2),
                ],
              ),
            ),
            Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: renderTransactionBox("Today"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Yesterday",
                        style: Theme.of(context).textTheme.headline2)
                  ]),
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: renderTransactionBox("Yesterday"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
