import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pocketexpense/helpers/TextFormatter.dart';
import 'package:pocketexpense/models/transaction.dart';
import 'package:pocketexpense/widgets/dashline.dart';
import 'package:provider/provider.dart';

import '../constant.dart';
import '../helpers/layoutdesign.dart';
import '../providers/accountprovider.dart';
import '../providers/transactionsprovider.dart';
import '../styles.dart';

class TransactionScreen extends StatefulWidget {
  Transaction selectedTransaction;
  TransactionScreen({Key? key, required this.selectedTransaction})
      : super(key: key);

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  TextEditingController? _controller;

  TextEditingController? _description;

  bool isEditable = false;
  initState() {
    _description =
        TextEditingController(text: widget.selectedTransaction.description);
    _controller = TextEditingController(
        text:
            "₱ ${TextFormatter.formatNumber(widget.selectedTransaction.amount.toString())}");
  }

  void onPressed() {
    if (isEditable) {
      Provider.of<AccountProvider>(context, listen: false)
          .makeChangesToWalletAmount(
              widget.selectedTransaction.amount.toDouble(),
              widget.selectedTransaction.accountID as String,
              widget.selectedTransaction.transactionType == "Income"
                  ? TransactOperation.addition
                  : TransactOperation.subtraction);
      Provider.of<TransactionsProvider>(context, listen: false)
          .editTransaction(widget.selectedTransaction);
    }
    setState(() {
      isEditable = !isEditable;
    });
  }

  Future<void> onPressedModal() async {
    Provider.of<TransactionsProvider>(context, listen: false)
        .removeTransaction(widget.selectedTransaction);

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        Future.delayed(
            Duration(seconds: 2),
            () => {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(homeRoute, (route) => false)
                });
        return AlertDialog(
          title: Text('Notice', style: Theme.of(context).textTheme.headline2),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Successfully removed',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Icon(Icons.check_circle),
              ],
            ),
          ),
        );
      },
    );
  }

  void onChangeText(data) {
    setState(() {
      widget.selectedTransaction.description = data;
    });
  }

  void onChangeAmount(data) {
    String newString = data.toString().substring(2, data.toString().length);
    String tempString = newString.replaceAll(",", "");
    setState(() {
      widget.selectedTransaction!.amount = int.parse(tempString);
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime dateTime =
        DateTime.parse(widget.selectedTransaction.timestamp as String);
    double screenHeight = MediaQuery.of(context).size.height;
    double computedHeight = screenHeight * 0.3;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            // leading: Icon(Icons.arrow_back, color: Colors.white),
            foregroundColor: background,
            backgroundColor: LayoutDesign.returnTransactionColor(
                widget.selectedTransaction.transactionType as String),
            elevation: 0,
            title: Row(
              children: [
                Expanded(
                    child: Center(
                        child: Text("Detail Transaction",
                            style: Theme.of(context)
                                .textTheme
                                .headline2
                                ?.copyWith(color: background)))),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet<void>(
                        barrierColor: Color.fromARGB(66, 0, 0, 0),
                        enableDrag: true,
                        context: context,
                        builder: (BuildContext builder) {
                          return BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                            child: Container(
                              height: 200.0,
                              color: background,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.drag_handle_rounded),
                                  Padding(
                                    padding: EdgeInsets.all(20.0),
                                    child: Text(
                                      "Remove this transaction?",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3!
                                          .copyWith(
                                              decoration: TextDecoration.none,
                                              color: onPrimary),
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                        text:
                                            "Are you sure do you wanna remove this \n transaction?",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1),
                                    textAlign: TextAlign.center,
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: background),
                                                onPressed: onPressed,
                                                child: Text("No",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1!
                                                        .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ))),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(
                                                onPressed: onPressedModal,
                                                child: Text("Yes",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1!
                                                        .copyWith(
                                                          color: background,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ))),
                                          ),
                                        )
                                      ]),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  child: Icon(
                    Icons.delete,
                  ),
                )
              ],
            )),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 8.0),
              height: computedHeight,
              decoration: BoxDecoration(
                  color: LayoutDesign.returnTransactionColor(
                      widget.selectedTransaction.transactionType as String),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "${widget.selectedTransaction.transTitle}",
                            style: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(
                                    fontSize: 24.0,
                                    color: background,
                                    fontWeight: FontWeight.normal),
                          ),
                          Text(
                            "${weekday[dateTime.weekday]} ${dateTime.day} ${months[dateTime.month]} ${dateTime.year}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: background),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: TextFormField(
                          enabled: isEditable,
                          controller: _controller,
                          style: TxtStyle.getAmountTxt,
                          textAlign: TextAlign.end,
                          inputFormatters: [TextFormatter()],
                          onChanged: onChangeAmount,
                          decoration: const InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                          keyboardType: TextInputType.number,
                          onTap: () {
                            _controller!.clear();
                          },
                        ),
                      ),
                    ),
                    Table(
                      children: [
                        TableRow(
                            decoration: BoxDecoration(
                                color: background,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0))),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                    child: Text("Type",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                color: Color.fromRGBO(
                                                    145, 145, 159, 1)))),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                    child: Text("Category",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                color: Color.fromRGBO(
                                                    145, 145, 159, 1)))),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                    child: Text("Wallet",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                color: Color.fromRGBO(
                                                    145, 145, 159, 1)))),
                              )
                            ]),
                        TableRow(
                            decoration: BoxDecoration(
                                color: background,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0))),
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Center(
                                    child: Text(
                                        widget.selectedTransaction
                                            .transactionType as String,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16.0,
                                                color: onPrimary))),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Center(
                                    child: Text(
                                        widget.selectedTransaction.category
                                            as String,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16.0,
                                                color: onPrimary))),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Center(
                                    child: Text(
                                        Provider.of<AccountProvider>(context,
                                                listen: false)
                                            .getAccount(widget
                                                .selectedTransaction
                                                .accountID as String)
                                            .accounttype,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16.0,
                                                color: onPrimary))),
                              )
                            ])
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: DashLine(
                  height: 1.0, color: Color.fromRGBO(145, 145, 159, 1)),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text("Description",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Color.fromRGBO(145, 145, 159, 1),
                            fontSize: 16.0)),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: TextFormField(
                        enabled: isEditable,
                        controller: _description,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 16.0),
                        textAlign: TextAlign.start,
                        onChanged: onChangeText,
                        decoration: const InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                        keyboardType: TextInputType.text,
                        onTap: () {
                          _description!.clear();
                        },
                      )),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "Attachment",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Color.fromRGBO(145, 145, 159, 1),
                          fontSize: 16.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Image.asset("assets/images/receipt.png"),
                  ),
                  ElevatedButton(
                      onPressed: onPressed,
                      child: Text(
                        isEditable ? "Done" : "Edit",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: background, fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
