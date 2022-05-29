import 'package:flutter/material.dart';
import 'package:pocketexpense/constant.dart';
import 'package:pocketexpense/styles.dart';

class CreateAccScreen extends StatefulWidget {
  const CreateAccScreen({Key? key}) : super(key: key);

  @override
  State<CreateAccScreen> createState() => _CreateAccScreenState();
}

class _CreateAccScreenState extends State<CreateAccScreen> {
  String? accountType;
  bool isEnabled = false;
  void onChanged(data) {
    setState(() {
      isEnabled = true;
      accountType = data;
    });
  }

  void _onPressed() {}
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: kPrimaryColor,
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
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                ),
                child: Row(
                  children: const [
                    Text(
                      "₱ 0.00",
                      style: TxtStyle.getAmountTxt,
                    )
                  ],
                ),
              ),
              Form(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 40),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      height: 54,
                      decoration: BoxStyle.getBoxDecoration,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Name',
                          hintStyle:
                              TextStyle(color: kPrimaryColor.withOpacity(0.5)),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
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
                        items: const [
                          DropdownMenuItem(value: "Bank", child: Text("Bank")),
                          DropdownMenuItem(
                              value: "Custom", child: Text("Custom"))
                        ],
                        onChanged: onChanged,
                        isExpanded: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
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
                                  padding: const EdgeInsets.all(5.0),
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
                                  padding: const EdgeInsets.all(5.0),
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
                                  padding: const EdgeInsets.all(5.0),
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
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
                                  padding: const EdgeInsets.all(5.0),
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
                                  padding: const EdgeInsets.all(5.0),
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
                                  padding: const EdgeInsets.all(5.0),
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
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ElevatedButton(
                          onPressed: isEnabled ? _onPressed : null,
                          style: BtnStyle.getButtonStyle1,
                          child: const Text("Setup",
                              style: TxtStyle.getButtonText1),
                        )),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
