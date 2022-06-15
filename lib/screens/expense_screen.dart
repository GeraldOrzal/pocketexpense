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

  void onPressed() {
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
  }

  @override
  Widget build(BuildContext context) {
    List<Account>? allAccount = context.watch<AccountProvider>().allAccounts;
    List<DropdownMenuItem> populateWalletDropdown() {
      List<DropdownMenuItem> list = [];
      for (var i = 0; i < allAccount!.length; i++) {
        list.add(DropdownMenuItem(
            value: allAccount![i].accountID,
            child: Text(
                allAccount![i].accounttype == "Custom"
                    ? "Custom"
                    : allAccount![i].bankName as String,
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
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 20,
                top: 0,
                bottom: 0,
                right: 0,
              ),
              height: size.height * 0.2,
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
            Form(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 35),
                    height: 54,
                    decoration: BoxStyle.getBoxDecoration,
                    child: DropdownButton(
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
                    child: DropdownButton(
                      hint: const Text("Wallet"),
                      value: currentTransaction?.accountID,
                      items: populateWalletDropdown(),
                      onChanged: onChangedWallet,
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
                        onPressed: onPressed,
                        child: Text(
                          "Continue",
                          style: Theme.of(context).textTheme.button,
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
