import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:image_picker/image_picker.dart';
import 'package:jaonmart_app/pages/profile_page.dart';
import 'package:jaonmart_app/pages/splash_screen.dart';
import 'package:jaonmart_app/services/auth_services.dart';
import 'package:jaonmart_app/services/storage_services.dart';
import 'package:jaonmart_app/theme.dart';
import 'package:jaonmart_app/widgets/profile_menu.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  final User user;
  ProfileScreen(this.user);
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? imagePath;
  var sendImg = 'default';
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference img_profile = firestore.collection('img_profile');
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
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
                  StreamBuilder<QuerySnapshot>(
                      stream: img_profile
                          .where('user_id', isEqualTo: widget.user.uid)
                          .snapshots(),
                      builder: (_, snapshot) {
                        if (snapshot.hasData) {
                          var myProfile = snapshot.data!.docs;
                          String? myimage;
                          for (var i = 0; i < myProfile.length; i++) {
                            myimage = (myProfile[i]['path_image']);
                            sendImg = myimage!;
                          }
                          return (myimage != null)
                              ? CircleAvatar(
                                  backgroundImage: NetworkImage(myimage),
                                )
                              : CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/images/AR.jpg'),
                                );
                        } else {
                          return CircleAvatar(
                            backgroundImage: AssetImage('assets/images/AR.jpg'),
                          );
                        }
                      }),
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
                          onPressed: () async {
                            XFile? file = await getImage();
                            await StorageServices.uploadImage(file!);
                            imagePath = await StorageServices.uploadImage(file);
                            setState(() {
                              img_profile.add({
                                'user_id': widget.user.uid,
                                'path_image': imagePath
                              });
                              setState(() {});
                            });
                          },
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfilePage(sendImg.toString())));
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
              press: () async {
                await AuthServices.signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SplashScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<XFile?> getImage() async {
    return await _picker.pickImage(source: ImageSource.gallery);
  }
}
