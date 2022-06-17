import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pocketexpense/constant.dart';
import 'package:pocketexpense/providers/accountprovider.dart';
import 'package:pocketexpense/providers/transactionsprovider.dart';
import 'package:pocketexpense/screens/account_screen.dart';
import 'package:pocketexpense/styles.dart';
import 'package:provider/provider.dart';

import '../helpers/TextFormatter.dart';
import '../models/account.dart';

class AccountEditScreen extends StatefulWidget {
  Account selectedAccount;
  AccountEditScreen({Key? key, required this.selectedAccount})
      : super(key: key);

  @override
  State<AccountEditScreen> createState() => _AccountEditScreenState();
}

class _AccountEditScreenState extends State<AccountEditScreen> {
  Account? selectedAccount;

  initState() {
    selectedAccount = widget.selectedAccount;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: background,
          backgroundColor: transfer,
          elevation: 0,
          centerTitle: true,
          title: Text("Edit Account",
              style: Theme.of(context)
                  .textTheme
                  .headline2
                  ?.copyWith(color: background)),
          actions: [
            IconButton(
                onPressed: () {
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
                                    "Remove this account?",
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
                                          "Removing account will also result in removing the transaction conducted from that account. Would you still want to continue?",
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
                icon: const Icon(MdiIcons.delete)),
          ],
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
              height: size.height * 0.3,
              decoration: const BoxDecoration(
                color: transfer,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Balance',
                      style: Theme.of(context).textTheme.headline2?.copyWith(
                          color: const Color.fromARGB(200, 252, 252, 252))),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    '₱ ${TextFormatter.formatNumber(widget.selectedAccount.amount)}',
                    style: TxtStyle.getAmountTxt,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 5.0,
                    color: Colors.black.withOpacity(0.23),
                  ),
                ],
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () =>
                        {Navigator.pushNamed(context, accountDetailsRoute)},
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          margin: const EdgeInsets.all(10.0),
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 241, 241, 250),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.0))),
                          child: const Icon(
                            MdiIcons.wallet,
                            color: transfer,
                            size: 32,
                          ),
                        ),
                        Text(
                          'Wallet',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const Spacer(),
                        Text(
                          '₱ 400.00',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () =>
                        {Navigator.pushNamed(context, accountDetailsRoute)},
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(13.0),
                          margin: const EdgeInsets.all(10.0),
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 241, 241, 250),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.0))),
                          child: Image.asset(
                            'assets/images/bank1.png',
                            scale: 1,
                          ),
                        ),
                        Text(
                          'Chase',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const Spacer(),
                        Text(
                          '₱ 1,000.00',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () =>
                        {Navigator.pushNamed(context, accountDetailsRoute)},
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          margin: const EdgeInsets.all(10.0),
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 241, 241, 250),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.0))),
                          child: Image.asset(
                            'assets/images/bank3.png',
                            scale: 1,
                          ),
                        ),
                        Text(
                          'Citi',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const Spacer(),
                        Text(
                          '₱ 6,000.00',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () =>
                        {Navigator.pushNamed(context, accountDetailsRoute)},
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(13.0),
                          margin: const EdgeInsets.all(10.0),
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 241, 241, 250),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.0))),
                          child: Image.asset(
                            'assets/images/bank2.png',
                            scale: 1,
                          ),
                        ),
                        Text(
                          'Paypal',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const Spacer(),
                        Text(
                          '₱ 2,000.00',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  void onPressed() {
    Navigator.pop(context);
  }

  Future<void> onPressedModal() async {
    Provider.of<AccountProvider>(context, listen: false)
        .removeAccount(selectedAccount as Account);
    Provider.of<TransactionsProvider>(context, listen: false)
        .removeTransactionByAccount(widget.selectedAccount.accountID as String);
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 2), () {
          Navigator.popUntil(context, (route) => route.isFirst);
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
}
