import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jaonmart_app/model/Item.dart';
import 'package:jaonmart_app/model/pack_item.dart';
import 'package:jaonmart_app/pages/profile_screen.dart';
import 'package:jaonmart_app/theme.dart';
import 'package:jaonmart_app/widgets/card_item.dart';

class DetailScreen extends StatefulWidget {
  final User user;
  final Items item;
  DetailScreen(this.user, this.item);
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late int _counter;
  late PackItems item;
  var Req = PackItems.getItems();
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference pesan_item = firestore.collection('pesan_item');
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/cart');
            },
            icon: Icon(
              Icons.shopping_cart_outlined,
              size: 30,
            ),
          ),
        ],
      ),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'RP ',
                    style: myBoldStyle.copyWith(fontSize: 17),
                    children: [
                      TextSpan(
                        text: '${widget.item.harga}',
                        style: myBoldStyle.copyWith(
                            fontSize: 28, fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: _setMinus,
                          icon: Icon(
                            Icons.remove,
                            size: 20,
                          )),
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        '${_counter}',
                        style: myStyle,
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      IconButton(
                        onPressed: _setPlus,
                        icon: Icon(
                          Icons.add,
                          size: 20,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            ElevatedButton(
              onPressed: () {
                pesan_item.add({
                  'id': widget.item.id,
                  'qty': _counter,
                  'nama': widget.item.nama,
                  'produk': widget.item.produk,
                  'harga': widget.item.harga,
                  'gambar': widget.item.gambar,
                  'dekskripsi': widget.item.dekskripsi,
                  'user_id': widget.user.uid,
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: Duration(seconds: 1),
                    backgroundColor: makeColor,
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Add your cart',
                          style: myStyle.copyWith(color: Colors.white),
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
              style: ElevatedButton.styleFrom(
                  primary: makeColor,
                  fixedSize: Size(MediaQuery.of(context).size.width * 0.9, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: Text(
                'Add to cart',
                style: myStyle.copyWith(color: Colors.white),
              ),
            )
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [
          Text(
            '${widget.item.nama}',
            style: myStyle.copyWith(fontSize: 20, color: makeColor),
          ),
          RichText(
            text: TextSpan(
              text: 'RP ',
              style: myBoldStyle.copyWith(fontSize: 15),
              children: [
                TextSpan(
                  text: '${widget.item.harga}',
                  // text: '${widget.item.harga  * counter}',
                  style: myBoldStyle.copyWith(
                      fontSize: 25, fontWeight: FontWeight.w900),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Container(
                  width: 210,
                  height: 320,
                  color: Colors.amber,
                  child: Image.asset(
                    'assets/images/${widget.item.gambar}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rekomendasi :',
                    style: myStyle.copyWith(fontSize: 14, color: Colors.black),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  for (var i = 0; i < 3; i++)
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            (MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                    widget.user,
                                    Items(
                                        id: Req[i].id,
                                        qty: Req[i].qty,
                                        nama: Req[i].nama,
                                        produk: Req[i].produk,
                                        harga: Req[i].harga,
                                        gambar: Req[i].gambar,
                                        dekskripsi: Req[i].dekskripsi)))));
                      },
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 10, right: 20, left: 10),
                        child: Container(
                          height: 80,
                          width: 80,
                          child: CardItemPack(PackItems(
                              id: Req[i].id,
                              qty: Req[i].qty,
                              nama: Req[i].nama,
                              produk: Req[i].produk,
                              harga: Req[i].harga,
                              gambar: Req[i].gambar,
                              dekskripsi: Req[i].dekskripsi)),
                        ),
                      ),
                    ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Description',
            style: myStyle.copyWith(
              fontSize: 25,
            ),
          ),
          Text('${widget.item.dekskripsi}'),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _counter = widget.item.qty;
  }

  void _setPlus() {
    setState(() {
      _counter++;
    });
  }

  void _setMinus() {
    if (_counter > 0) {
      setState(() {
        _counter--;
      });
    }
  }
}
