import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jaonmart_app/pages/home_screen.dart';
import 'package:jaonmart_app/pages/my_account.dart';
import 'package:jaonmart_app/pages/profile_page.dart';
import 'package:jaonmart_app/pages/signin_screen.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return (user == null) ? SignInScreen() : WProfile();
  }
}

class WProfile extends StatelessWidget {
  const WProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference profile = firestore.collection('profile');
    var user_profile;
    return StreamBuilder<QuerySnapshot>(
        stream: profile.where('id', isEqualTo: user.uid).snapshots(),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            var myData = snapshot.data!.docs;
            for (var i = 0; i < myData.length; i++) {
              user_profile = myData[i]['id'];
            }
          }
          return (user_profile == null) ? MyAccount() : HomeScreen(user);
        });
  }
}
