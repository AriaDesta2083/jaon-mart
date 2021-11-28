import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jaonmart_app/pages/cart_screen.dart';
import 'package:jaonmart_app/pages/profile_screen.dart';

class TopHome extends StatelessWidget {
  final User user;
  TopHome(this.user);
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference profile = firestore.collection('profile');
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProfileScreen(user)));
          },
          child: StreamBuilder<QuerySnapshot>(
              stream: profile.where('user_id', isEqualTo: user.uid).snapshots(),
              builder: (_, snapshot) {
                if (snapshot.hasData) {
                  var myProfile = snapshot.data!.docs;
                  String? myimage;
                  for (var i = 0; i < myProfile.length; i++) {
                    myimage = (myProfile[i]['path_image']);
                  }
                  return (myimage != null)
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            myimage,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            'assets/images/AR.jpg',
                            width: 60,
                            fit: BoxFit.cover,
                          ),
                        );
                } else {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      'assets/images/AR.jpg',
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                  );
                }
              }),
        ),
        Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      (context),
                      MaterialPageRoute(
                        builder: (context) => CartScreen(),
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
