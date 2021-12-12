import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jaonmart_app/pages/order_screen.dart';
import 'package:jaonmart_app/theme.dart';
import 'package:jaonmart_app/widgets/cart_add.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late int total = 0;
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference pesanItem = firestore.collection('pesan_item');
    return Scaffold(
      body: Scaffold(
        bottomNavigationBar: Container(
          height: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(1, -3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total',
                    style: myStyle.copyWith(fontSize: 18, color: makeColor),
                  ),
                  StreamBuilder<QuerySnapshot>(
                      stream: pesanItem
                          .where('user_id', isEqualTo: user.uid)
                          .snapshots(),
                      builder: (_, snapshot) {
                        if (snapshot.hasData) {
                          var myList = snapshot.data!.docs;
                          total = 0;
                          for (var i = 0; i < myList.length; i++) {
                            int hasil = (myList[i]['qty'] * myList[i]['harga']);
                            total += hasil;
                          }
                          return RichText(
                            text: TextSpan(
                              text: 'RP ',
                              style: myBoldStyle.copyWith(fontSize: 17),
                              children: [
                                TextSpan(
                                  text: '$total',
                                  style: myBoldStyle.copyWith(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w900),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return RichText(
                            text: TextSpan(
                              text: 'RP ',
                              style: myBoldStyle.copyWith(fontSize: 17),
                              children: [
                                TextSpan(
                                  text: '0',
                                  style: myBoldStyle.copyWith(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w900),
                                ),
                              ],
                            ),
                          );
                        }
                      })
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Order()));
                },
                style: ElevatedButton.styleFrom(
                    primary: makeColor,
                    fixedSize: Size(150, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: Text(
                  'Order Now',
                  style: myStyle.copyWith(color: Colors.white),
                ),
              )
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Cart',
            style: myAppBarStyle,
          ),
        ),
        body: SafeArea(
          child: ListView(
            children: [
              //! 1 x Get
              // FutureBuilder<QuerySnapshot>(
              //   future: pesan_item.get(),
              //   builder: (_, snapshot) {
              //     if (snapshot.hasData) {
              //       return Column(
              //         children: snapshot.data.docs
              //             .map(
              //               (item) => CartAdd(
              //                   item.data()['id'],
              //                   item.data()['qty'],
              //                   item.data()['nama'],
              //                   item.data()['produk'],
              //                   item.data()['gambar'],
              //                   item.data()['harga'],
              //                   item.data()['dekskripsi']),
              //             )
              //             .toList(),
              //       );
              //     } else {
              //       return Text('Belum Ada Pesanan');
              //     }
              //   },
              // )

              StreamBuilder<QuerySnapshot>(
                stream:
                    pesanItem.where('user_id', isEqualTo: user.uid).snapshots(),
                builder: (_, snapshot) {
                  if (snapshot.hasData) {
                    var myItems = snapshot.data!.docs;
                    return Column(
                      children: myItems
                          .map(
                            (item) => CartAdd(
                              item['id'],
                              item['qty'],
                              item['nama'],
                              item['produk'],
                              item['gambar'],
                              item['harga'],
                              item['dekskripsi'],
                              upCart: () {
                                pesanItem
                                    .doc(item.id)
                                    .update({'qty': item['qty'] + 1});
                              },
                              minCart: () {
                                if (item['qty'] > 0) {
                                  pesanItem
                                      .doc(item.id)
                                      .update({'qty': item['qty'] - 1});
                                }
                              },
                              delCart: () {
                                pesanItem.doc(item.id).delete();
                              },
                            ),
                          )
                          .toList(),
                    );
                  } else {
                    return Center(
                      child: Text(
                        'Belum Ada Pesanan',
                        style: myStyle,
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
