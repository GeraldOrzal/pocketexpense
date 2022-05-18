import 'package:flutter/material.dart';
import '../styles.dart';

class SetupScreen extends StatefulWidget {
  SetupScreen({Key? key}) : super(key: key);

  @override
  State<SetupScreen> createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {
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
    return SafeArea(
        child: Scaffold(
            body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
          Container(
              height: 200.0,
              child: Text("P 0.00"),
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0)))),
          Form(
              child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: "Name"),
              ),
              DropdownButton(
                  hint: Text("Account Type"),
                  value: accountType,
                  items: [
                    DropdownMenuItem(child: Text("Bank"), value: "Bank"),
                    DropdownMenuItem(child: Text("Custom"), value: "Custom")
                  ],
                  icon: Image.asset(
                    'assets/images/arrowdown.png',
                    scale: 1.5,
                  ),
                  onChanged: onChanged),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          width: 80.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(241, 241, 250, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Image.asset(
                            'assets/images/bank1.png',
                            scale: 1,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          width: 80.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(241, 241, 250, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Image.asset(
                            'assets/images/bank2.png',
                            scale: 1,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          width: 80.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(241, 241, 250, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Image.asset(
                            'assets/images/bank3.png',
                            scale: 1,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          width: 80.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(241, 241, 250, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Image.asset(
                            'assets/images/bank4.png',
                            scale: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Colors.red,
                          width: 20.0,
                          height: 20.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Colors.red,
                          width: 20.0,
                          height: 20.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Colors.red,
                          width: 20.0,
                          height: 20.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Colors.red,
                          width: 20.0,
                          height: 20.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                    onPressed: isEnabled ? _onPressed : null,
                    style: AuthStyle.getButtonStyle1,
                    child: const Text("Setup", style: AuthStyle.getButtonText1),
                  )),
            ],
          ))
        ])));
  }
}
