import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jaonmart_app/model/Item.dart';
import 'package:jaonmart_app/model/pack_item.dart';
import 'package:jaonmart_app/pages/detail_screen.dart';
import 'package:jaonmart_app/theme.dart';
import 'package:jaonmart_app/widgets/card_item.dart';
import 'package:jaonmart_app/widgets/home_widgets.dart';

class HomeScreen extends StatefulWidget {
  final User user;
  HomeScreen(this.user);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [
              TopHome(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Text(
                'JAON MART',
                style: myBoldStyle.copyWith(fontSize: 24),
              ),
              Text(
                widget.user.uid,
                style: myBoldStyle.copyWith(
                    color: makeColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 370,
                child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    scrollDirection: Axis.horizontal,
                    children: items
                        .map(
                          (item) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (c) => DetailScreen(
                                      widget.user,
                                      Items(
                                          id: item.id,
                                          qty: item.qty,
                                          nama: item.nama,
                                          produk: item.produk,
                                          gambar: item.gambar,
                                          harga: item.harga,
                                          dekskripsi: item.dekskripsi),
                                    ),
                                  ),
                                );
                              },
                              child: CardItem(
                                  widget.user,
                                  Items(
                                      id: item.id,
                                      qty: item.qty,
                                      nama: item.nama,
                                      produk: item.produk,
                                      gambar: item.gambar,
                                      harga: item.harga,
                                      dekskripsi: item.dekskripsi)),
                            ),
                          ),
                        )
                        .toList()),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Packs',
                style: myBoldStyle.copyWith(fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 120,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: packs
                        .map((pack) => InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailScreen(
                                            widget.user,
                                            Items(
                                                id: pack.id,
                                                qty: pack.qty,
                                                nama: pack.nama,
                                                produk: pack.produk,
                                                harga: pack.harga,
                                                gambar: pack.gambar,
                                                dekskripsi: pack.dekskripsi))));
                              },
                              child: CardItemPack(PackItems(
                                  id: pack.id,
                                  qty: pack.qty,
                                  nama: pack.nama,
                                  produk: pack.produk,
                                  harga: pack.harga,
                                  gambar: pack.gambar,
                                  dekskripsi: pack.dekskripsi)),
                            ))
                        .toList()),
              )
            ],
          ),
        ),
      )),
    );
  }
}
