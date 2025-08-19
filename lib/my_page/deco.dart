import 'dart:math';

import 'package:flutter/material.dart';
import 'package:talking_potato/my_page/list_item.dart';
import 'package:talking_potato/my_page/wear_item.dart';

class DecoPotato extends StatefulWidget {
  const DecoPotato({super.key});

  @override
  State<DecoPotato> createState() => _DecoPotatoState();
}

class _DecoPotatoState extends State<DecoPotato> {
  // selected Item
  int? selHead;
  int? selStuff;
  int? selClothes;
  int? selFace;

  // List Item
  late List<ListItem> headList;
  late List<ListItem> stuffList;
  late List<ListItem> clothesList;
  late List<ListItem> faceList;

  // Wear Item
  late List<WearItem> headItem;
  late List<WearItem> stuffItem;
  late List<Potato> clothesItem;
  late List<WearItem> faceItem;

  @override
  void initState() {
    super.initState();
    // 화면 시작할 때 sellHead, selFace 등
    // provider에서 불러와서 initState에서 초기화하기
    initList();
    initWearItem();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFFEF4D9),
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/deco_pota/background.png',
                  width: width,
                  fit: BoxFit.fitWidth,
                ),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 55,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 24.0, right: 16),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/icons/potato.png',
                              width: ratio(27, width),
                            ),
                            const Padding(padding: EdgeInsets.only(left: 6)),
                            Text(
                              '마이페이지',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: ratio(20, width),
                                fontFamily: 'Binggrae',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Expanded(child: Container()),
                            Image.asset(
                              'assets/icons/account.png',
                              width: ratio(24, width),
                            ),
                            const Padding(padding: EdgeInsets.only(left: 20)),
                            Image.asset(
                              'assets/icons/hamburger.png',
                              width: ratio(24, width),
                            )
                          ],
                        ),
                      ),
                    ),
                    Text(
                      '날 꾸며 보겠는감!?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF111111),
                        fontSize: ratio(28, width),
                        fontFamily: 'Binggrae',
                        fontWeight: FontWeight.w700,
                        letterSpacing: -1.40,
                      ),
                    ),
                  ],
                ),
                if (selClothes != null) clothesItem[selClothes!] else Potato(name: 'potato'),
                if (selHead != null) headItem[selHead!],
                if (selStuff != null) stuffItem[selStuff!],
                if (selFace != null) faceItem[selFace!],
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 33.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/deco_pota/tab/all.png', width: ratio(40, width)),
                  Image.asset('assets/deco_pota/tab/shirt.png', width: ratio(34, width)),
                  Image.asset('assets/deco_pota/tab/pants.png', width: ratio(28, width)),
                  Image.asset('assets/deco_pota/tab/head.png', width: ratio(28, width)),
                  Image.asset('assets/deco_pota/tab/face.png', width: ratio(39, width)),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 10,
                    children: [
                      ...headList.map((e) => InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                            setState(() {
                              if (selHead == headList.indexOf(e)) {
                                initHeadList();
                                selHead = null;
                              } else {
                                initHeadList(id: headList.indexOf(e));
                              }
                            });
                          },
                          child: e)),
                      ...stuffList.map((e) => InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                            setState(() {
                              if (selStuff == stuffList.indexOf(e)) {
                                initStuffList();
                                selStuff = null;
                              } else {
                                initStuffList(id: stuffList.indexOf(e));
                              }
                            });
                          },
                          child: e)),
                      ...clothesList.map((e) => InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                            setState(() {
                              if (selClothes == clothesList.indexOf(e)) {
                                initClothesList();
                                selFace = null;
                              } else {
                                initClothesList(id: clothesList.indexOf(e));
                              }
                            });
                          },
                          child: e)),
                      ...faceList.map((e) => InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                            setState(() {
                              if (selFace == faceList.indexOf(e)) {
                                initFaceList();
                                selFace = null;
                              } else {
                                initFaceList(id: faceList.indexOf(e));
                              }
                            });
                          },
                          child: e)),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(ratio(15, width)), // 원하는 값
                    ),
                    backgroundColor: const Color(0xFFA400FF),
                    elevation: 4),
                onPressed: () {
                  // provider에 현재 상태 저장
                  // selHead, selShirt 등..
                  // 화면 시작할 때 provider에서 불러와서 initState에서 초기화하기
                },
                child: SizedBox(
                  width: double.infinity,
                  height: ratio(50, width),
                  child: const Center(
                    child: Text(
                      '감자 꾸미기 저장하기',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void printSelected(List<ListItem> list) {
    for (var e in list) {
      print(e.selected);
    }
  }

  void initList({int? selHead, int? selStuff, int? selFace, int? selShirt, int? selPants}) {
    initClothesList(id: selClothes);
    initHeadList(id: selHead);
    initStuffList(id: selStuff);
    initFaceList(id: selFace);
  }

  void initHeadList({int? id}) {
    headList = [
      ListItem(
        image: 'hairpin',
        imgWidth: 60,
        selected: const ValueKey(false),
        sell: true,
      ),
      ListItem(
        image: 'hat',
        imgWidth: 64.5,
        selected: const ValueKey(false),
        sell: false,
      ),
    ];

    if (id != null) {
      headList[id].selected = const ValueKey(true);
      selHead = id;
    }
  }

  void initStuffList({int? id}) {
    stuffList = [
      ListItem(
        image: 'acorn',
        imgWidth: 46.08,
        selected: const ValueKey(false),
        sell: true,
      ),
      ListItem(
        image: 'camera',
        imgWidth: 52.92,
        selected: const ValueKey(false),
        sell: false,
      ),
      ListItem(
        image: 'coffee',
        imgWidth: 40.24,
        selected: const ValueKey(false),
        sell: false,
      ),
    ];

    if (id != null) {
      stuffList[id].selected = const ValueKey(true);
      selStuff = id;
    }
  }

  void initClothesList({int? id}) {
    clothesList = [
      ListItem(
        image: 'check',
        imgWidth: 58.09,
        selected: const ValueKey(false),
        sell: false,
      ),
      ListItem(
        image: 'hood',
        imgWidth: 57.8,
        selected: const ValueKey(false),
        sell: false,
      ),
      ListItem(
        image: 'jean',
        imgWidth: 57.03,
        selected: const ValueKey(false),
        sell: true,
      ),
      ListItem(
        image: 'jogger',
        imgWidth: 47.5,
        selected: const ValueKey(false),
        sell: true,
      ),
    ];

    if (id != null) {
      clothesList[id].selected = const ValueKey(true);
      selClothes = id;
    } else {
      selClothes = null;
    }
  }

  void initFaceList({int? id}) {
    faceList = [
      ListItem(
        image: 'glasses',
        imgWidth: 60.68,
        selected: const ValueKey(false),
        sell: false,
      ),
      ListItem(
        image: 'sunglasses',
        imgWidth: 55.84,
        selected: const ValueKey(false),
        sell: false,
      ),
    ];

    if (id != null) {
      faceList[id].selected = const ValueKey(true);
      selFace = id;
    }
  }

  void initWearItem() {
    initClothesItem();
    initHeadItem();
    initStuffItem();
    initFaceItem();
  }

  void initHeadItem() {
    headItem = [
      WearItem(
        name: 'hairpin',
        top: 83,
        left: 113,
        width: 122,
      ),
      WearItem(
        name: 'hat',
        top: 93,
        left: 132,
        width: 87,
      )
    ];
  }

  void initStuffItem() {
    stuffItem = [
      WearItem(
        name: 'acorn',
        width: 54,
        top: 141,
        left: 224,
      ),
      WearItem(
        name: 'camera',
        width: 60,
        top: 163,
        left: 231,
      ),
      WearItem(
        name: 'coffee',
        width: 45,
        top: 154,
        left: 228,
      ),
    ];
  }

  void initClothesItem() {
    clothesItem = [
      Potato(name: 'check'),
      Potato(name: 'hood'),
      Potato(name: 'jean'),
      Potato(name: 'jogger'),
    ];
  }

  void initFaceItem() {
    faceItem = [
      WearItem(
        name: 'glasses',
        width: 65.77,
        top: 148.54,
        left: 146.35,
      ),
      WearItem(
        name: 'sunglasses',
        width: 70.83,
        top: 149.93,
        left: 144.59,
      ),
    ];
  }
}

//
double ratio(double number, double width) {
  return width / 360 * number;
}
