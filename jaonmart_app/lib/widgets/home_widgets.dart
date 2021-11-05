import 'package:flutter/material.dart';

class TopHome extends StatelessWidget {
  const TopHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed('/profile');
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              'assets/images/AR.jpg',
              width: 60,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/cart');
                },
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  size: 27,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert_sharp,
                  size: 27,
                )),
          ],
        ),
      ],
    );
  }
}
