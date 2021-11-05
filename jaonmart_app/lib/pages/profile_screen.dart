import 'package:flutter/material.dart';
import 'package:jaonmart_app/theme.dart';
import 'package:jaonmart_app/widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text("Profile"),
          ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            SizedBox(
              height: 115,
              width: 115,
              child: Stack(
                fit: StackFit.expand,
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      "assets/images/AR.jpg",
                    ),
                  ),
                  Positioned(
                    right: -16,
                    bottom: 0,
                    child: SizedBox(
                      height: 46,
                      width: 46,
                      child: TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                              side: BorderSide(color: Colors.white),
                            ),
                            primary: Colors.white,
                            backgroundColor: Color(0xFFF5F6F9),
                          ),
                          onPressed: () {},
                          child: Icon(
                            Icons.add_a_photo,
                            color: makeColor,
                          )),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            ProfileMenu(
              text: "My Account",
              icon: Icon(Icons.account_box_outlined),
              press: () {
                Navigator.of(context).pushNamed('/account');
              },
            ),
            // ProfileMenu(
            //   text: "Notifications",
            //   icon: Icon(Icons.notifications_sharp),
            //   press: () {},
            // ),
            // ProfileMenu(
            //   text: "Settings",
            //   icon: Icon(Icons.settings),
            //   press: () {},
            // ),
            // ProfileMenu(
            //   text: "Help Center",
            //   icon: Icon(Icons.help_outline_outlined),
            //   press: () {},
            // ),
            ProfileMenu(
              text: "Log Out",
              icon: Icon(Icons.logout_sharp),
              press: () {
                Navigator.of(context).pushNamed('/signin');
              },
            ),
          ],
        ),
      ),
    );
  }
}
