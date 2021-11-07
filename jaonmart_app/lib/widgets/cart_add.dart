import 'package:flutter/material.dart';
import 'package:jaonmart_app/model/Item.dart';
import 'package:jaonmart_app/theme.dart';

class CartAdd extends StatefulWidget {
  final Items item;
  CartAdd(this.item);

  @override
  State<CartAdd> createState() => _CartAddState();
}

class _CartAddState extends State<CartAdd> {
  late int _counter;

  @override
  Widget build(BuildContext context) {
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
              'assets/images/${widget.item.gambar}',
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
                  '${widget.item.nama}',
                  style: myStyle.copyWith(fontSize: 15, color: makeColor),
                ),
                Text(
                  '${widget.item.produk}',
                  style: myStyle.copyWith(
                      fontSize: 14, fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'RP. ${widget.item.harga}',
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
                    onPressed: _setMinus,
                    icon: Icon(
                      Icons.remove,
                      size: 20,
                    )),
                Text(
                  '${_counter}',
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
