// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';

import '../Styles/color.dart';
import '../Styles/font_styles.dart';

class Brands extends StatefulWidget {
  const Brands({Key? key}) : super(key: key);

  @override
  State<Brands> createState() => _BrandsState();
}

class _BrandsState extends State<Brands> {
  RxInt currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Stack(
            children: [
              Visibility(
                visible: currentIndex.value == 0,
                child: AnimatedContainer(
                  height: 44.0,
                  alignment: Alignment.centerRight,
                  decoration: BoxDecoration(
                      color: customBlue,
                      borderRadius: BorderRadius.circular(100.0)),
                  duration: const Duration(milliseconds: 1000),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 45, right: 10),
                    child: Text(
                      "Nike",
                      style: textStyle3,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Bounce(
                  onPressed: () {
                    currentIndex.value = 0;
                    //setState(() {});
                  },
                  duration: const Duration(milliseconds: 200),
                  child: Image.asset(
                    "assets/logos/nike_logo.png",
                    width: currentIndex.value == 0 ? 34.0 : 44.0,
                    height: currentIndex.value == 0 ? 34.0 : 44.0,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 5.0,
          ),
          Stack(
            children: [
              Visibility(
                visible: currentIndex.value == 1,
                child: Container(
                  height: 44.0,
                  alignment: Alignment.centerRight,
                  decoration: BoxDecoration(
                      color: customBlue,
                      borderRadius: BorderRadius.circular(100.0)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 45, right: 10),
                    child: Text(
                      "Puma",
                      style: textStyle3,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Bounce(
                  onPressed: () {
                    currentIndex.value = 1;
                    //setState(() {});
                  },
                  duration: const Duration(milliseconds: 200),
                  child: Image.asset(
                    "assets/logos/puma_logo.png",
                    width: currentIndex.value == 1 ? 34.0 : 44.0,
                    height: currentIndex.value == 1 ? 34.0 : 44.0,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 5.0,
          ),
          Stack(
            children: [
              Visibility(
                visible: currentIndex.value == 2,
                child: Container(
                  height: 44.0,
                  alignment: Alignment.centerRight,
                  decoration: BoxDecoration(
                      color: customBlue,
                      borderRadius: BorderRadius.circular(100.0)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 45, right: 10),
                    child: Text(
                      "Under",
                      style: textStyle3,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Bounce(
                  onPressed: () {
                    currentIndex.value = 2;
                  },
                  duration: const Duration(milliseconds: 200),
                  child: Image.asset(
                    "assets/logos/under_armour_logo.png",
                    width: currentIndex.value == 2 ? 34.0 : 44.0,
                    height: currentIndex.value == 2 ? 34.0 : 44.0,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 5.0,
          ),
          Stack(
            children: [
              Visibility(
                visible: currentIndex.value == 3,
                child: Container(
                  height: 44.0,
                  alignment: Alignment.centerRight,
                  decoration: BoxDecoration(
                      color: customBlue,
                      borderRadius: BorderRadius.circular(100.0)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 45, right: 10),
                    child: Text(
                      "Adidas",
                      style: textStyle3,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Bounce(
                  onPressed: () {
                    currentIndex.value = 3;
                    //setState(() {});
                  },
                  duration: const Duration(milliseconds: 200),
                  child: Image.asset(
                    "assets/logos/adidas_logo.png",
                    width: currentIndex.value == 3 ? 34.0 : 44.0,
                    height: currentIndex.value == 3 ? 34.0 : 44.0,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 5.0,
          ),
          Stack(
            children: [
              Visibility(
                visible: currentIndex.value == 4,
                child: Container(
                  height: 44.0,
                  alignment: Alignment.centerRight,
                  decoration: BoxDecoration(
                      color: customBlue,
                      borderRadius: BorderRadius.circular(100.0)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 45, right: 10),
                    child: Text(
                      "Converse",
                      style: textStyle3,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Bounce(
                  onPressed: () {
                    currentIndex.value = 4;
                    //setState(() {});
                  },
                  duration: const Duration(milliseconds: 200),
                  child: Image.asset(
                    "assets/logos/converse_logo.png",
                    width: currentIndex.value == 4 ? 34.0 : 44.0,
                    height: currentIndex.value == 4 ? 34.0 : 44.0,
                  ),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Visibility(
                visible: currentIndex.value == 5,
                child: Container(
                  height: 44.0,
                  alignment: Alignment.centerRight,
                  decoration: BoxDecoration(
                      color: customBlue,
                      borderRadius: BorderRadius.circular(100.0)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 45, right: 10),
                    child: Text(
                      "Nike",
                      style: textStyle3,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Bounce(
                  onPressed: () {
                    currentIndex.value = 5;
                    //setState(() {});
                  },
                  duration: const Duration(milliseconds: 200),
                  child: Image.asset(
                    "assets/logos/nike_logo.png",
                    width: currentIndex.value == 5 ? 34.0 : 44.0,
                    height: currentIndex.value == 5 ? 34.0 : 44.0,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
