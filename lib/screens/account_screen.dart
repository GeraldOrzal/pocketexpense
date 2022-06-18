import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pocketexpense/constant.dart';
import 'package:pocketexpense/helpers/textformatter.dart';
import 'package:pocketexpense/styles.dart';
import 'package:provider/provider.dart';

import '../models/account.dart';
import '../providers/accountprovider.dart';

class AccountScreen extends StatefulWidget {
  AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    List<Account> allAccounts = context.watch<AccountProvider>().allAccounts;
    List<Widget> generateWidgets() {
      List<Widget> list = [];

      allAccounts.forEach((element) {
        list.add(GestureDetector(
          onTap: () => {
            Navigator.pushNamed(context, accountDetailsRoute,
                arguments: element)
          },
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 241, 241, 250),
                    borderRadius: BorderRadius.all(Radius.circular(6.0))),
                child: const Icon(
                  MdiIcons.wallet,
                  color: transfer,
                  size: 32,
                ),
              ),
              Text(
                '${element.accounttype == "Custom" ? "Wallet" : element.bankName}',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const Spacer(),
              Text(
                '₱ ${TextFormatter.formatNumber(element.amount)}',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ));
      });
      return list;
    }

    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: background,
          backgroundColor: transfer,
          elevation: 0,
          centerTitle: true,
          title: Text("Account",
              style: Theme.of(context)
                  .textTheme
                  .headline2
                  ?.copyWith(color: background)),
        ),
        body: Column(
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: Text(
                      '₱ ${TextFormatter.formatNumber(context.watch<AccountProvider>().totalAmount.toStringAsFixed(2))}',
                      style: TxtStyle.getAmountTxt,
                    ),
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
                // color: Colors.white,
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
                children: generateWidgets(),
              ),
            ),
            const Spacer(),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 60),
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton.icon(
                  icon: const Icon(
                    MdiIcons.plus,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Add new wallet",
                    style: Theme.of(context).textTheme.button,
                  ),
                  style: ElevatedButton.styleFrom(primary: transfer),
                  onPressed: () {
                    Navigator.pushNamed(context, crtAccountRoute);
                  },
                )),
          ],
        ),
      ),
    );
  }
}
