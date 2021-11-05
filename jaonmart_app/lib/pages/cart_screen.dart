import 'package:flutter/material.dart';
import 'package:jaonmart_app/model/Item.dart';
import 'package:jaonmart_app/model/pack_item.dart';
import 'package:jaonmart_app/theme.dart';
import 'package:jaonmart_app/widgets/cart_add.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late List<Items> items;
  late List<PackItems> packs;
  @override
  void initState() {
    items = Items.getItems();
    packs = PackItems.getItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    RichText(
                      text: TextSpan(
                        text: 'RP ',
                        style: myBoldStyle.copyWith(fontSize: 17),
                        children: [
                          TextSpan(
                            text: '280.000',
                            style: myBoldStyle.copyWith(
                                fontSize: 28, fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: makeColor,
                      fixedSize: Size(150, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: Text(
                    'Payment',
                    style: myStyle.copyWith(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text('Cart'),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert_sharp,
                    size: 30,
                  ))
            ],
          ),
          body: SafeArea(
            child: ListView(
                children: items
                    .map((item) => CartAdd(Items(
                        id: item.id,
                        qty: item.qty,
                        nama: item.nama,
                        produk: item.produk,
                        gambar: item.gambar,
                        harga: item.harga,
                        dekskripsi: item.dekskripsi)))
                    .toList()),
          )),
    );
  }
}
