import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jaonmart_app/theme.dart';

class CartAdd extends StatefulWidget {
  final int id, qty, harga;
  final String produk, nama, dekskripsi, gambar;
  final Function delCart;
  final Function upCart;
  final Function minCart;

  CartAdd(this.id, this.qty, this.nama, this.produk, this.gambar, this.harga,
      this.dekskripsi,
      {required this.delCart, required this.upCart, required this.minCart});

  @override
  State<CartAdd> createState() => _CartAddState();
}

class _CartAddState extends State<CartAdd> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference pesan_item = firestore.collection('pesan_item');
    return Card(
      elevation: 3,
      margin: EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/images/${widget.gambar}',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  '${widget.nama}',
                  style: myStyle.copyWith(fontSize: 15, color: makeColor),
                ),
                Text(
                  '${widget.produk}',
                  style: myStyle.copyWith(
                      fontSize: 14, fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'RP. ${widget.harga}',
                  // 'RP. ${item.harga * counter}',
                  style: myStyle.copyWith(
                      fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 10),
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              children: [
                IconButton(
                    onPressed: (widget.qty != 0) ? _setMinus : _delCarrt,
                    icon: (widget.qty != 0)
                        ? Icon(
                            Icons.remove,
                            size: 20,
                          )
                        : Icon(
                            Icons.delete,
                            color: Colors.red,
                            size: 21,
                          )),
                Text(
                  '${widget.qty}',
                  style: myStyle,
                ),
                IconButton(
                    onPressed: _setPlus,
                    icon: Icon(
                      Icons.add,
                      size: 20,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  void _setPlus() {
    setState(() {
      widget.upCart();
    });
  }

  void _setMinus() {
    if (widget.qty > 0) {
      setState(() {
        widget.minCart();
      });
    }
  }

  void _delCarrt() {
    setState(() {
      widget.delCart();
    });
  }
}
