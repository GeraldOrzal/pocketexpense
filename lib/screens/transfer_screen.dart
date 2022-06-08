import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pocketexpense/constant.dart';
import 'package:pocketexpense/styles.dart';

class TransferScreen extends StatefulWidget {
  TransferScreen({Key? key}) : super(key: key);

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  void onChanged(data) {}
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          foregroundColor: background,
          backgroundColor: transfer,
          elevation: 0,
          centerTitle: true,
          title: Text("Transfer",
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
                    child: TextFormField(
                      style: Theme.of(context).textTheme.bodyText1,
                      decoration: const InputDecoration(
                        hintText: 'From:',
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
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
                    child: TextFormField(
                      style: Theme.of(context).textTheme.bodyText1,
                      decoration: const InputDecoration(
                        hintText: 'To:',
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
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
                        style: ElevatedButton.styleFrom(primary: transfer),
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
