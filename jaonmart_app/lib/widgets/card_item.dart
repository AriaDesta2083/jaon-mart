import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jaonmart_app/model/Item.dart';
import 'package:jaonmart_app/model/pack_item.dart';
import 'package:jaonmart_app/theme.dart';

class CardItem extends StatelessWidget {
  final User user;
  final Items item;
  CardItem(this.user, this.item);
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference pesan_item = firestore.collection('pesan_item');
    return Card(
      color: Colors.white,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 3,
      child: Container(
        width: 220,
        height: 330,
        child: Column(
          children: [
            Image.asset(
              'assets/images/${item.gambar}',
              height: 220,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5, left: 8, right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '${item.nama}',
                    style: myStyle.copyWith(fontSize: 18, color: makeColor),
                  ),
                  Text(
                    '${item.produk}',
                    style: myBoldStyle.copyWith(
                      fontSize: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '${item.harga}',
                          style: myStyle.copyWith(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          onPressed: () {
                            //! ADD DATA
                            pesan_item.add({
                              'id': item.id,
                              'qty': item.qty,
                              'nama': item.nama,
                              'produk': item.produk,
                              'harga': item.harga,
                              'gambar': item.gambar,
                              'dekskripsi': item.dekskripsi,
                              'user_id': user.uid,
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: Duration(seconds: 1),
                                backgroundColor: makeColor,
                                content: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Add your cart',
                                      style:
                                          myStyle.copyWith(color: Colors.white),
                                    ),
                                    Icon(
                                      Icons.task_alt_rounded,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.add_circle_sharp,
                            color: makeColor,
                            size: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CardItemPack extends StatelessWidget {
  final PackItems pack;
  CardItemPack(this.pack);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        height: 120,
        width: 120,
        child: Image.asset(
          'assets/images/${pack.gambar}',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
