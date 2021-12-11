import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jaonmart_app/services/auth_services.dart';
import 'package:jaonmart_app/theme.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  final String img;

  ProfilePage(this.img);
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference profile = firestore.collection('profile');
    var firstname = ' ';
    var lastname = ' ';
    var phone = ' ';
    var addres = ' ';
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: profile.where('id', isEqualTo: user.uid).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var myProfile = snapshot.data!.docs;
              for (var i = 0; i < myProfile.length; i++) {
                firstname = myProfile[i]['firstName'];
                lastname = myProfile[i]['lastName'];
                phone = myProfile[i]['phoneNumber'];
                addres = myProfile[i]['address'];
              }
            }
            return SafeArea(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 3,
                        color: Colors.indigoAccent,
                        child: Image.network(
                          img,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 4,
                    color: makeColor.withOpacity(0.8),
                    margin: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                            size: 37,
                          ),
                          title: Text(
                            'Name',
                            style: myStylelight,
                          ),
                          subtitle: Text(
                            firstname + ' ' + lastname,
                            style: myStylelight,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.home,
                            color: Colors.white,
                            size: 37,
                          ),
                          title: Text(
                            'Addres',
                            style: myStylelight,
                          ),
                          subtitle: Text(
                            addres,
                            style: myStylelight,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.phone,
                            color: Colors.white,
                            size: 37,
                          ),
                          title: Text(
                            'Phone',
                            style: myStylelight,
                          ),
                          subtitle: Text(
                            phone,
                            style: myStylelight,
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.mail,
                            color: Colors.white,
                            size: 37,
                          ),
                          title: Text(
                            'Email',
                            style: myStylelight,
                          ),
                          subtitle: Text(
                            user.email.toString(),
                            style: myStylelight,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Back',
                      style: myStylelight.copyWith(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: makeColor.withOpacity(0.8),
                        fixedSize: Size(120, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  Spacer(),
                ],
              ),
            );
          }),
    );
  }
}
