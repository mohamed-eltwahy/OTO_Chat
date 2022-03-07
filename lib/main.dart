import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tel_chat/data/auth.dart';
import 'package:tel_chat/helper/app_router.dart';
import 'package:tel_chat/layout/home.dart';
import 'package:tel_chat/layout/signin.dart';
import 'package:tel_chat/layout/splash.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp(
  ));
}

class MyApp extends StatelessWidget {
  // final AppRouter? router;

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // onGenerateRoute: router!.generateRoute,
      theme: ThemeData(
        fontFamily: 'Cairo',
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: AuthMethods().getCurrentUser(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return const HomeScreen();
          } else {
            return const SignIn();
          }
        },
      ),
    );
  }
}
