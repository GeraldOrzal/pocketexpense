import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pocketexpense/constant.dart';
import 'package:pocketexpense/providers/userprovider.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pocketexpense/constant.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void onPressed() {
    FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushNamedAndRemoveUntil(entryRoute, (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: background,
          padding: const EdgeInsets.fromLTRB(10, 80, 0, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundColor: primary,
                    child: ClipOval(
                      child: SizedBox(
                        width: 180.0,
                        height: 180.0,
                        child: Image.network(
                            "https://images.unsplash.com/photo-1654650231825-f1c06db0c1ba?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
                            fit: BoxFit.fill),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Username',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Tony Stark',
                        style: Theme.of(context).textTheme.headline2,
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  const Icon(
                    MdiIcons.pencilOutline,
                    size: 30,
                  ),
                ],
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
                      onTap: () => {Navigator.pushNamed(context, accountRoute)},
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            margin: const EdgeInsets.all(10.0),
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 238, 229, 255),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6.0))),
                            child: const Icon(
                              MdiIcons.wallet,
                              color: transfer,
                              size: 32,
                            ),
                          ),
                          Text(
                            'Account',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          margin: const EdgeInsets.all(10.0),
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 238, 229, 255),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.0))),
                          child: const Icon(
                            MdiIcons.trayArrowUp,
                            color: transfer,
                            size: 32,
                          ),
                        ),
                        Text(
                          'Export Data',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        logoutDialog();
                      },
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            margin: const EdgeInsets.all(10.0),
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 255, 226, 228),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6.0))),
                            child: const Icon(
                              MdiIcons.logout,
                              color: primary,
                              size: 32,
                            ),
                          ),
                          Text(
                            'Logout',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future logoutDialog() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: const Center(
              child: Text(
                'Log out?',
                style: TextStyle(
                  color: primary,
                  fontSize: 24,
                  fontFamily: 'Inter',
                ),
              ),
            ),
            content: Container(
              width: MediaQuery.of(context).size.width / 1.2,
              height: MediaQuery.of(context).size.height / 8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Center(
                    child: Text(
                      'Are you sure you want to logout?',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                        margin: const EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                        decoration: const BoxDecoration(
                            color: primary,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        child: const Text(
                          'Yes',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Inter',
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                        margin: const EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        child: const Text(
                          'No',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: 'Inter',
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            // actions: [TextButton(onPressed: () {}, child: const Text('Yes'))],
          ));
}
