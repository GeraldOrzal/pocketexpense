import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pocketexpense/models/userdetails.dart';
import 'package:pocketexpense/providers/accountprovider.dart';
import 'package:pocketexpense/providers/transactionsprovider.dart';
import 'package:pocketexpense/providers/userprovider.dart';
import 'package:pocketexpense/routes.dart';
import 'package:pocketexpense/screens/account_screen.dart';
import 'package:pocketexpense/screens/createacc_screen.dart';
import 'package:pocketexpense/screens/entry_screen.dart';
import 'package:pocketexpense/screens/expense_screen.dart';
import 'package:pocketexpense/screens/home_screen.dart';
import 'package:pocketexpense/screens/loading_screen.dart';
import 'package:pocketexpense/screens/mainhome_screen.dart';
import 'package:pocketexpense/screens/start_screen.dart';
import 'package:pocketexpense/styles.dart';
import 'package:pocketexpense/widgets/auth_widget.dart';
import 'package:provider/provider.dart';
import 'constant.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => AccountProvider()),
        ChangeNotifierProvider(create: (_) => TransactionsProvider())
      ],
      builder: (context, widget) {
        return MaterialApp(
          title: 'Material App',
          theme: defaultThemeData,
          onGenerateRoute: generateRoute,
          home: AuthWidget(),
        );
      },
    );
  }
}
