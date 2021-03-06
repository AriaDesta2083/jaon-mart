import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:jaonmart_app/pages/order_screen.dart';
import 'package:jaonmart_app/pages/splash_screen.dart';
import 'package:jaonmart_app/routes.dart';
import 'package:jaonmart_app/services/auth_services.dart';
import 'package:jaonmart_app/theme.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthServices.userStream,
      initialData: null,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        routes: myRoutes,
        theme: theme(),
      ),
    );
  }
}
