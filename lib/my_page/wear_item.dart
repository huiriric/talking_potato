import 'package:flutter/material.dart';
import 'package:talking_potato/my_page/deco.dart';

class WearItem extends StatelessWidget {
  String name;
  double width;
  double top;
  double left;

  WearItem({
    super.key,
    required this.name,
    required this.width,
    required this.top,
    required this.left,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Positioned(
      width: ratio(width, size.width),
      top: ratio(top, size.width),
      left: ratio(left, size.width),
      child: Image.asset('assets/deco_pota/item/$name.png'),
    );
  }
}

class Potato extends StatelessWidget {
  String name;

  Potato({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Positioned(
      top: ratio(99, width),
      left: ratio(71, width),
      child: Image.asset(
        'assets/deco_pota/potato/$name.png',
        width: ratio(216, width),
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
