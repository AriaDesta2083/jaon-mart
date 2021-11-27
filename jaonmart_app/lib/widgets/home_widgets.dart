import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jaonmart_app/pages/profile_screen.dart';

class TopHome extends StatelessWidget {
  final User user;
  TopHome(this.user);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed('/profile');
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              'assets/images/AR.jpg',
              width: 60,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      (context),
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(user),
                      ));
                },
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  size: 27,
                )),
          ],
        ),
      ],
    );
  }
}
