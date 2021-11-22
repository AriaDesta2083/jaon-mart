import 'package:flutter/cupertino.dart';
import 'package:jaonmart_app/pages/cart_screen.dart';
import 'package:jaonmart_app/pages/home_screen.dart';
import 'package:jaonmart_app/pages/my_account.dart';
import 'package:jaonmart_app/pages/profile_screen.dart';
import 'package:jaonmart_app/pages/signin_screen.dart';
import 'package:jaonmart_app/pages/signup_screen.dart';
import 'package:jaonmart_app/pages/splash_screen.dart';

final Map<String, WidgetBuilder> myRoutes = {
  '/splash': (context) => SplashScreen(),
  '/signin': (context) => SignInScreen(),
  '/signup': (context) => SignUpScreen(),
  '/cart': (context) => CartScreen(),
  '/profile': (context) => ProfileScreen(),
  '/account': (context) => MyAccount(),
};
