import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pocketexpense/constant.dart';
import 'package:pocketexpense/models/account.dart';
import 'package:pocketexpense/styles.dart';
import 'package:provider/provider.dart';

import '../models/userdetails.dart';
import '../providers/accountprovider.dart';
import '../providers/userprovider.dart';

class CreateAccScreen extends StatefulWidget {
  const CreateAccScreen({Key? key}) : super(key: key);

  @override
  State<CreateAccScreen> createState() => _CreateAccScreenState();
}

class _CreateAccScreenState extends State<CreateAccScreen> {
  String? bankName;
  String? userName;
  String? accountType;
  bool isEnabled = false;
  final DatabaseReference userDetailsRef =
      FirebaseDatabase.instance.ref().child('users');
  String? currentAmount = "0.00";

  bool isValid(String data) {
    RegExp myExp = RegExp("^[0-9]*\.?[0-9]*\$");
    return myExp.hasMatch(data);
  }

  void onChangedInput(data) {
    print(data);
    setState(() {
      userName = data;
    });
  }

  void onChanged(data) {
    String _data = data;
    if (_data.isEmpty) {
      setState(() {
        currentAmount = "0.00";
      });
      return;
    }
    if (isValid(data)) {
      setState(() {
        currentAmount = _data;
      });
      if (_data.contains(".")) {}
      return;
    }
    // if (data is double || data is int) {
    //   setState(() {
    //     currentAmount = data;
    //   });
    //   return;
    // }
    setState(() {
      isEnabled = true;
      accountType = data;
    });
  }

  Future<void> onPressedModal() async {
    Provider.of<AccountProvider>(context, listen: false).addAccount(Account(
      accounttype: accountType as String,
      amount: currentAmount.toString(),
      initialAmount: currentAmount.toString(),
    ));
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 2), () {
          setState(() {
            currentAmount = "0.00";
            accountType = null;
          });
          Navigator.of(context).pop();
        });
        return AlertDialog(
          title: Text('Notice', style: Theme.of(context).textTheme.headline2),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Successfully Created',
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

  void _onPressed() {}

  @override
  Widget build(BuildContext context) {
    UserDetails? userDetails = context.watch<UserProvider>().userDetails;

    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: primary,
            elevation: 0,
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
                  color: primary,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                ),
                child: Row(
                  children: [
                    Text(
                      '₱ ${currentAmount}',
                      style: TxtStyle.getAmountTxt,
                    )
                  ],
                ),
              ),
              Form(
                child: Column(
                  children: [
                    Visibility(
                      visible: userDetails == null ? true : false,
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 40),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        height: 54,
                        decoration: BoxStyle.getBoxDecoration,
                        child: TextFormField(
                          initialValue: userName,
                          style: Theme.of(context).textTheme.bodyText1,
                          onChanged: onChangedInput,
                          decoration: const InputDecoration(
                            hintText: 'Name',
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      height: 54,
                      decoration: BoxStyle.getBoxDecoration,
                      child: DropdownButton(
                        hint: const Text("Account Type"),
                        value: accountType,
                        items: [
                          DropdownMenuItem(
                              value: "Bank",
                              child: Text("Bank",
                                  style:
                                      Theme.of(context).textTheme.bodyText2)),
                          DropdownMenuItem(
                              value: "Custom",
                              child: Text("Custom",
                                  style: Theme.of(context).textTheme.bodyText2))
                        ],
                        onChanged: onChanged,
                        isExpanded: true,
                      ),
                    ),
                    accountType != null
                        ? Padding(
                            padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                            child: accountType == "Bank"
                                ? Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Container(
                                                height: 35.0,
                                                decoration: BoxStyle.getBankBox,
                                                child: Image.asset(
                                                  'assets/images/bank.png',
                                                  scale: 1,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Container(
                                                height: 35.0,
                                                decoration: BoxStyle.getBankBox,
                                                child: Image.asset(
                                                  'assets/images/bank1.png',
                                                  scale: 1,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Container(
                                                height: 35.0,
                                                decoration: BoxStyle.getBankBox,
                                                child: Image.asset(
                                                  'assets/images/bank2.png',
                                                  scale: 1,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Container(
                                                height: 35.0,
                                                decoration: BoxStyle.getBankBox,
                                                child: Image.asset(
                                                  'assets/images/bank3.png',
                                                  scale: 1,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Container(
                                                height: 35.0,
                                                decoration: BoxStyle.getBankBox,
                                                child: Image.asset(
                                                  'assets/images/bank4.png',
                                                  scale: 1,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Container(
                                                height: 35.0,
                                                decoration: BoxStyle.getBankBox,
                                                child: Image.asset(
                                                  'assets/images/bank5.png',
                                                  scale: 1,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Container(
                                                height: 35.0,
                                                decoration: BoxStyle.getBankBox,
                                                child: Image.asset(
                                                  'assets/images/bank6.png',
                                                  scale: 1,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Container(
                                                height: 35.0,
                                                decoration: BoxStyle.getBankBox,
                                                child: Image.asset(
                                                  'assets/images/other.png',
                                                  scale: 1,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                : TextFormField(
                                    keyboardType: TextInputType.number,
                                    initialValue: currentAmount,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                    decoration:
                                        InputDecoration(hintText: "Amount"),
                                    onChanged: onChanged),
                          )
                        : Container(),
                    Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ElevatedButton(
                          onPressed: isEnabled &&
                                  userDetails != null &&
                                  !userDetails.isFirstTime
                              ? onPressedModal
                              : () {
                                  Provider.of<UserProvider>(context,
                                          listen: false)
                                      .updateDetails(UserDetails(
                                    fullname: userName as String,
                                    isFirstTime: false,
                                  ));

                                  Provider.of<AccountProvider>(context,
                                          listen: false)
                                      .addAccount(Account(
                                    accounttype: accountType as String,
                                    amount: currentAmount.toString(),
                                    initialAmount: currentAmount.toString(),
                                  ));
                                  Navigator.of(context)
                                      .pushReplacementNamed(successRoute);
                                },
                          child: Text(
                              "${userDetails == null ? "Setup" : "Create Account"}",
                              style: Theme.of(context).textTheme.button),
                        )),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
