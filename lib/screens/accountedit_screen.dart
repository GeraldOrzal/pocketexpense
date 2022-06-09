import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pocketexpense/constant.dart';
import 'package:pocketexpense/styles.dart';

class AccountEditScreen extends StatefulWidget {
  AccountEditScreen({Key? key}) : super(key: key);

  @override
  State<AccountEditScreen> createState() => _AccountEditScreenState();
}

class _AccountEditScreenState extends State<AccountEditScreen> {
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
            IconButton(onPressed: () => {}, icon: const Icon(MdiIcons.delete)),
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
                  const Text(
                    '₱ 9,400.00',
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
    );
  }
}
