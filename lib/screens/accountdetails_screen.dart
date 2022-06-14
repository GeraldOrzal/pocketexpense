import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pocketexpense/constant.dart';
import 'package:pocketexpense/styles.dart';
import 'package:pocketexpense/widgets/transaction_box.dart';

class AccountDetails extends StatefulWidget {
  AccountDetails({Key? key}) : super(key: key);

  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
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
          title: Text("Account Details",
              style: Theme.of(context)
                  .textTheme
                  .headline2
                  ?.copyWith(color: background)),
          actions: [
            IconButton(
                onPressed: () =>
                    {Navigator.pushNamed(context, accountEditRoute)},
                icon: const Icon(MdiIcons.pencil)),
          ],
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
                  const Center(
                    child: Text(
                      '₱ 9,400.00',
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
              height: 200.0,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Yesterday",
                      style: Theme.of(context).textTheme.headline2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
