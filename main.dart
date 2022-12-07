import 'package:edman/routes/route.dart';
import 'package:edman/screens/login.dart';
import 'package:edman/screens/signup.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //This is the first screen that will load when the app launches
      initialRoute: LocationalMove.signup,
      //The List of routes that can be navigated to. You can find this in the route.dart file in the routes folder
      routes: {
        //The LoginPage that is referred to is found in the screens folder in a file called login.dart
        LocationalMove.login: (context) => const LoginPage(),
        //The LoginPage that is referred to is found in the screens folder in a filer called signup.dart
        LocationalMove.signup: (context) => const SignUp(),
      },
    );
  }
}
