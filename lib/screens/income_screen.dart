import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pocketexpense/constant.dart';
import 'package:pocketexpense/styles.dart';

class IncomeScreen extends StatefulWidget {
  IncomeScreen({Key? key}) : super(key: key);

  @override
  State<IncomeScreen> createState() => _IncomeScreenState();
}

class _IncomeScreenState extends State<IncomeScreen> {
  void onChanged(data) {}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          foregroundColor: background,
          backgroundColor: income,
          elevation: 0,
          centerTitle: true,
          title: Text("Income",
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
              height: size.height * 0.5,
              decoration: const BoxDecoration(
                color: income,
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
                  const Text(
                    '₱ 0.00',
                    style: TxtStyle.getAmountTxt,
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
                      // value: categoryType,
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
                      onChanged: onChanged,
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
                      // value: categoryType,
                      items: [
                        DropdownMenuItem(
                            value: "Gcash",
                            child: Text("Gcash",
                                style: Theme.of(context).textTheme.bodyText2)),
                        DropdownMenuItem(
                            value: "Paypal",
                            child: Text("Paypal",
                                style: Theme.of(context).textTheme.bodyText2))
                      ],
                      onChanged: onChanged,
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
                        style: ElevatedButton.styleFrom(primary: income),
                        onPressed: () {},
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
