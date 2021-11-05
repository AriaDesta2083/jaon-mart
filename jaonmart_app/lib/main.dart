import 'package:flutter/material.dart';
import 'package:jaonmart_app/pages/splash_screen.dart';
import 'package:jaonmart_app/routes.dart';
import 'package:jaonmart_app/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: myRoutes,
      theme: theme(),
    );
  }
}
