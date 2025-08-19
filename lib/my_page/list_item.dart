import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:talking_potato/my_page/deco.dart';

class ListItem extends StatelessWidget {
  String image;
  double imgWidth;
  ValueKey<bool> selected;
  bool sell;

  ListItem({
    super.key,
    required this.image,
    required this.imgWidth,
    required this.selected,
    required this.sell,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: ratio(71, size.width),
          height: ratio(71, size.width),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: selected.value ? 3 : 1,
              color: selected.value ? const Color(0xFFA400FF) : const Color(0xFFDDDDDD),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Image.asset(
              'assets/deco_pota/list/$image.png',
              width: imgWidth > 71 ? ratio(71, size.width) : ratio(imgWidth, size.width),
              // 에러가 발생할 경우를 대비한 플레이스홀더 추가
            ),
          ),
        ),
        if (sell)
          Positioned(
            right: ratio(4, size.width),
            top: ratio(4, size.width),
            child: const Coin(),
          ),
      ],
    );
  }
}

class Coin extends StatelessWidget {
  const Coin({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: ratio(19, width),
      height: ratio(19, width),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
      decoration: ShapeDecoration(
        color: const Color(0xFFFFF166),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            color: Color(0xFFF6C16B),
          ),
          borderRadius: BorderRadius.circular(9.50),
        ),
      ),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '₩',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFEFA336),
              fontSize: 11,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w700,
              height: 1.30,
              letterSpacing: -0.55,
            ),
          ),
        ],
      ),
    );
  }
}
