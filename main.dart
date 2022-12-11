import 'package:dvla/routes/route.dart';
import 'package:dvla/screens/display.dart';
import 'package:dvla/screens/login.dart';
import 'package:dvla/screens/signup.dart';
import 'package:dvla/screens/homepage.dart';
import 'package:dvla/screens/visitor_form.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //This is the first screen that will load when the app launches
      initialRoute: LocationalMove.homepage,
      //initialRoute: LocationalMove.display,
      //The List of routes that can be navigated to. You can find this in the route.dart file in the routes folder
      routes: {
        //The LoginPage that is referred to is found in the screens folder in a file called login.dart
        LocationalMove.login: (context) => const LoginPage(),
        //The LoginPage that is referred to is found in the screens folder in a filer called signup.dart
        LocationalMove.signup: (context) => const SignUp(),
        LocationalMove.display: (context) => const Servercall(),
        LocationalMove.homepage: (context) => const HomePage(),
        LocationalMove.visitorform: (context) => const VisitorForm(),
      },
    );
  }
}
