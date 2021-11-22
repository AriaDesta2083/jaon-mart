import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jaonmart_app/pages/home_screen.dart';
import 'package:jaonmart_app/pages/signin_screen.dart';
import 'package:jaonmart_app/services/wrapper.dart';
import 'package:jaonmart_app/theme.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var userr;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: makeGradientColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitThreeInOut(
              color: makeColor,
              size: 100,
            ),
            Text( 
              'JAONMART',
              style: myStyle,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    //!Validasi waktu loading
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => Wrapper()));
      },
    );
  }
}
