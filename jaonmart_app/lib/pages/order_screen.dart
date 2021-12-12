import 'package:flutter/material.dart';
import 'package:jaonmart_app/theme.dart';

class Order extends StatelessWidget {
  const Order({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Order'),
        ),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: makeGradientColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.verified_outlined,
                  size: 120,
                  color: makeColor.withOpacity(0.7),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Order Success',
                  style: myBoldStyle,
                ),
              ],
            ),
          ),
        ));
  }
}
