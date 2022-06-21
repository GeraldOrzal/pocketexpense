import 'package:flutter/material.dart';
import 'package:pocketexpense/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Dark Mode',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Container(
              child:
                  Consumer<ThemeProvider>(builder: (context, provider, child) {
                return Switch(
                    value: provider.isDarkMode,
                    onChanged: (value) {
                      provider.toggleTheme(value);
                    });
              }),
            ),
          ],
        ),
      ),
    );
  }
}
