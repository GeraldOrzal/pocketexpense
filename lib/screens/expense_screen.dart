import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pocketexpense/constant.dart';
import 'package:pocketexpense/helpers/TextFormatter.dart';
import 'package:pocketexpense/providers/accountprovider.dart';
import 'package:provider/provider.dart';
import 'package:pocketexpense/styles.dart';
import '../helpers/layoutdesign.dart';
import '../models/account.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart' as TransactionDetails;
import '../providers/transactionsprovider.dart';

class ExpenseScreen extends StatefulWidget {
  final String transactionType;
  ExpenseScreen({Key? key, required this.transactionType}) : super(key: key);

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  TransactionDetails.Transaction? currentTransaction;
  TextEditingController? _controller;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String errorMessage = '';

  void initState() {
    currentTransaction = TransactionDetails.Transaction(
        accountID: null,
        timestamp: "",
        transactionType: widget.transactionType,
        category: null,
        amount: 0,
        description: "");
    _controller = TextEditingController(
        text: "₱ ${currentTransaction!.amount.toStringAsFixed(2)}");
  }

  void onChangedCategory(data) {
    setState(() {
      currentTransaction!.category = data;
    });
  }

  void onChangedWallet(data) {
    setState(() {
      currentTransaction!.accountID = data;
    });
  }

  void onChangeDescription(data) {
    setState(() {
      currentTransaction!.description = data;
    });
  }

  void onChangeAmount(data) {
    String newString = data.toString().substring(2, data.toString().length);
    String tempString = newString.replaceAll(",", "");
    setState(() {
      currentTransaction!.amount = int.parse(tempString);
    });
  }

  Future<void> onPressed() {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();
    }
    setState(() {
      currentTransaction!.timestamp =
          DateFormat('yyyy-MM-ddTHH:mm:ss').format(DateTime.now());
    });
    Provider.of<AccountProvider>(context, listen: false)
        .makeChangesToWalletAmount(
            currentTransaction!.amount.toDouble(),
            currentTransaction!.accountID as String,
            widget.transactionType == "Income"
                ? TransactOperation.addition
                : TransactOperation.subtraction);
    Provider.of<TransactionsProvider>(context, listen: false)
        .addTransaction(currentTransaction!);
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
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Center(
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 32,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    'Save Successfully',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Account>? allAccount = context.watch<AccountProvider>().allAccounts;
    List<DropdownMenuItem> populateWalletDropdown() {
      List<DropdownMenuItem> list = [];
      for (var i = 0; i < allAccount.length; i++) {
        list.add(DropdownMenuItem(
            value: allAccount[i].accountID,
            child: Text(
                allAccount[i].accounttype == "Custom"
                    ? "Custom"
                    : allAccount[i].bankName as String,
                style: Theme.of(context).textTheme.bodyText2)));
      }
      return list;
    }

    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          foregroundColor: background,
          backgroundColor: LayoutDesign.returnTransactionColor(
              widget.transactionType as String),
          elevation: 0,
          centerTitle: true,
          title: Text(widget.transactionType,
              style: Theme.of(context)
                  .textTheme
                  .headline2
                  ?.copyWith(color: background)),
        ),
        body: Form(
          key: _formkey,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 0,
                  bottom: 0,
                  right: 0,
                ),
                height: size.height * 0.3,
                decoration: BoxDecoration(
                  color: LayoutDesign.returnTransactionColor(
                      widget.transactionType as String),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('How much?',
                        style: Theme.of(context).textTheme.headline2?.copyWith(
                            color: const Color.fromARGB(200, 252, 252, 252))),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      // validator: (value) {
                      //   if (value == "₱ 0.00") {
                      //     return 'Input Amount';
                      //   }
                      //   return null;
                      // },
                      controller: _controller,
                      style: TxtStyle.getAmountTxt,
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
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 35),
                    height: 54,
                    decoration: BoxStyle.getBoxDecoration,
                    child: DropdownButtonFormField(
                      decoration: const InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                      hint: const Text("Category"),
                      value: currentTransaction?.category,
                      items: [
                        DropdownMenuItem(
                            value: "Subscription",
                            child: Text("Subscription",
                                style: Theme.of(context).textTheme.bodyText2)),
                        DropdownMenuItem(
                            value: "Mortgage",
                            child: Text("Mortgage",
                                style: Theme.of(context).textTheme.bodyText2))
                      ],
                      onChanged: onChangedCategory,
                      validator: (value) {
                        if (value == null) {
                          return 'Please Select a Category';
                        }
                      },
                      isExpanded: true,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: 54,
                    decoration: BoxStyle.getBoxDecoration,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Input Description';
                        }
                      },
                      style: Theme.of(context).textTheme.bodyText1,
                      onChanged: onChangeDescription,
                      decoration: const InputDecoration(
                        hintText: 'Description',
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 35),
                    height: 54,
                    decoration: BoxStyle.getBoxDecoration,
                    child: DropdownButtonFormField(
                      decoration: const InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                      hint: const Text("Wallet"),
                      value: currentTransaction?.accountID,
                      items: populateWalletDropdown(),
                      onChanged: onChangedWallet,
                      isExpanded: true,
                      validator: (value) {
                        if (value == null) {
                          return 'Please Select Your Wallet';
                        }
                      },
                    ),
                  ),
                  Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      height: 54,
                      decoration: BoxStyle.getBoxDecoration,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(MdiIcons.paperclip),
                          Text(
                            'Add Attachment',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(color: Colors.grey),
                          )
                        ],
                      )),
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 60),
                      padding: const EdgeInsets.all(15.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: LayoutDesign.returnTransactionColor(
                                widget.transactionType as String)),
                        onPressed: () {
                          continueDialog();
                        },
                        child: Text(
                          "Continue",
                          style: Theme.of(context).textTheme.button,
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future continueDialog() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: const Center(
              child: Text(
                'Transaction Title',
                style: TextStyle(
                  color: primary,
                  fontSize: 24,
                  fontFamily: 'Inter',
                ),
              ),
            ),
            content: Container(
              width: MediaQuery.of(context).size.width / 1.2,
              height: MediaQuery.of(context).size.height / 7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: TextFormField(
                      style: Theme.of(context).textTheme.bodyText1,
                      onChanged: onChangeDescription,
                      decoration: const InputDecoration(
                        hintText: 'Please Input Title',
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: onPressed,
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                          margin: const EdgeInsets.symmetric(
                            vertical: 20,
                          ),
                          decoration: const BoxDecoration(
                              color: primary,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          child: const Text(
                            'Save',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Inter',
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                        margin: const EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: 'Inter',
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            // actions: [TextButton(onPressed: () {}, child: const Text('Yes'))],
          ));
}
