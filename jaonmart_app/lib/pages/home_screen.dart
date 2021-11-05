import 'package:flutter/material.dart';
import 'package:jaonmart_app/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tes Theme',
        ),
      ),
      body: Center(
        child: Text(
          'Tes Theme',
          style: myBoldStyle,
        ),
      ),
    );
  }
}
