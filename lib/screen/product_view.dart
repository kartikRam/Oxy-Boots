// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutterprojects/Styles/color.dart';
import 'package:flutterprojects/Styles/font_styles.dart';
import 'package:get/get.dart';

class ProductView extends StatefulWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  RxInt selectShows = 0.obs;
  RxInt countryIndex = 0.obs;
  RxInt sizeIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgWhite,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 50.0,
                ),
                Row(
                  children: [
                    Bounce(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        duration: const Duration(milliseconds: 500),
                        child: Image.asset(
                          "assets/icons/back_ic.png",
                          width: 44.0,
                          height: 44.0,
                        )),
                    const Spacer(),
                    Text(
                      "Men’s Shoes",
                      style: textStyle4,
                    ),
                    const Spacer(),
                    Bounce(
                        onPressed: () {},
                        duration: const Duration(milliseconds: 500),
                        child: Image.asset(
                          "assets/icons/cart_ic.png",
                          width: 44.0,
                          height: 44.0,
                        )),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    const SizedBox(
                      width: double.infinity,
                      height: 150.0,
                    ),
                    Positioned(
                      bottom: 20,
                      child: Image.asset(
                        "assets/images/rotate.png",
                        height: 50.0,
                        width: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Image.asset(
                      "assets/shows/img3.png",
                      width: double.infinity,
                      height: 200,
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24.0),
                          topRight: Radius.circular(24.0))),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "BEST SELLER",
                          style: textStyle5,
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          "Nike Air Jordan",
                          style: textStyle4,
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          "\$ 967.800",
                          style: textStyle4,
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          "Air Jordan is an American brand of basketball shoes athletic, casual, and style clothing produced by Nike....",
                          style: textStyle7,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          "Gallery",
                          style: textStyle4,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Obx(
                            ()=> Row(
                              children: [
                                Bounce(
                                  onPressed: () {
                                    selectShows.value = 0;
                                    //setState(() {});
                                  },
                                  duration: const Duration(milliseconds: 500),
                                  child: Container(
                                    width: 56.0,
                                    height: 56.0,
                                    decoration: BoxDecoration(
                                        color: selectShows.value == 0
                                            ? customBlue
                                            : bgWhite,
                                        borderRadius:
                                            BorderRadius.circular(16.0)),
                                    child: Image.asset("assets/shows/img2.png"),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15.0,
                                ),
                                Bounce(
                                  onPressed: () {
                                    selectShows.value = 1;
                                    //setState(() {});
                                  },
                                  duration: const Duration(milliseconds: 500),
                                  child: Container(
                                    width: 56.0,
                                    height: 56.0,
                                    decoration: BoxDecoration(
                                        color: selectShows.value == 1
                                            ? customBlue
                                            : bgWhite,
                                        borderRadius:
                                            BorderRadius.circular(16.0)),
                                    child: Image.asset("assets/shows/img3.png"),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15.0,
                                ),
                                Bounce(
                                  onPressed: () {
                                    selectShows.value = 2;
                                    //setState(() {});
                                  },
                                  duration: const Duration(milliseconds: 500),
                                  child: Container(
                                    width: 56.0,
                                    height: 56.0,
                                    decoration: BoxDecoration(
                                        color: selectShows.value == 2
                                            ? customBlue
                                            : bgWhite,
                                        borderRadius:
                                            BorderRadius.circular(16.0)),
                                    child: Image.asset("assets/shows/img1.png"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Obx(
                          ()=> Row(
                            children: [
                              Text(
                                "Size",
                                style: textStyle4,
                              ),
                              const Spacer(),
                              Bounce(
                                  onPressed: () {
                                    countryIndex.value = 0;
                                    //setState(() {});
                                  },
                                  duration: const Duration(milliseconds: 200),
                                  child: Text(
                                    "EU",
                                    style: countryIndex.value == 0
                                        ? textStyle4
                                        : textStyle5,
                                  )),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Bounce(
                                  onPressed: () {
                                    countryIndex.value = 1;
                                    //setState(() {});
                                  },
                                  duration: const Duration(milliseconds: 200),
                                  child: Text(
                                    "US",
                                    style: countryIndex.value == 1
                                        ? textStyle4
                                        : textStyle5,
                                  )),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Bounce(
                                  onPressed: () {
                                    countryIndex.value = 2;
                                    //setState(() {});
                                  },
                                  duration: const Duration(milliseconds: 200),
                                  child: Text("UK",
                                      style: countryIndex.value == 2
                                          ? textStyle4
                                          : textStyle5))
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Obx(
                          ()=> Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Bounce(
                                onPressed: () {
                                  sizeIndex.value = 0;
                                  //setState(() {});
                                },
                                duration: const Duration(milliseconds: 200),
                                child: CircleAvatar(
                                  radius: 18,
                                  backgroundColor:
                                      sizeIndex.value == 0 ? customBlue : bgWhite,
                                  child: Text(
                                    "38",
                                    style:
                                        sizeIndex.value == 0 ? textStyle8 : textStyle1,
                                  ),
                                ),
                              ),
                              Bounce(
                                onPressed: () {
                                  sizeIndex.value = 1;
                                  //setState(() {});
                                },
                                duration: const Duration(milliseconds: 200),
                                child: CircleAvatar(
                                  radius: 18,
                                  backgroundColor:
                                      sizeIndex.value == 1 ? customBlue : bgWhite,
                                  child: Text(
                                    "39",
                                    style:
                                        sizeIndex.value == 1 ? textStyle8 : textStyle1,
                                  ),
                                ),
                              ),
                              Bounce(
                                onPressed: () {
                                  sizeIndex.value = 2;
                                  //setState(() {});
                                },
                                duration: const Duration(milliseconds: 200),
                                child: CircleAvatar(
                                  radius: 18,
                                  backgroundColor:
                                      sizeIndex.value == 2 ? customBlue : bgWhite,
                                  child: Text(
                                    "40",
                                    style:
                                        sizeIndex.value == 2 ? textStyle8 : textStyle1,
                                  ),
                                ),
                              ),
                              Bounce(
                                onPressed: () {
                                  sizeIndex.value = 3;
                                  //setState(() {});
                                },
                                duration: const Duration(milliseconds: 200),
                                child: CircleAvatar(
                                  radius: 18,
                                  backgroundColor:
                                      sizeIndex.value == 3 ? customBlue : bgWhite,
                                  child: Text(
                                    "41",
                                    style:
                                        sizeIndex.value == 3 ? textStyle8 : textStyle1,
                                  ),
                                ),
                              ),
                              Bounce(
                                onPressed: () {
                                  sizeIndex.value = 4;
                                  //setState(() {});
                                },
                                duration: const Duration(milliseconds: 200),
                                child: CircleAvatar(
                                  radius: 18,
                                  backgroundColor:
                                      sizeIndex.value == 4 ? customBlue : bgWhite,
                                  child: Text(
                                    "41",
                                    style:
                                        sizeIndex.value == 4 ? textStyle8 : textStyle1,
                                  ),
                                ),
                              ),
                              Bounce(
                                onPressed: () {
                                  sizeIndex.value = 5;
                                  //setState(() {});
                                },
                                duration: const Duration(milliseconds: 200),
                                child: CircleAvatar(
                                  radius: 18,
                                  backgroundColor:
                                      sizeIndex.value == 5 ? customBlue : bgWhite,
                                  child: Text(
                                    "41",
                                    style:
                                        sizeIndex.value == 5 ? textStyle8 : textStyle1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 70.0,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(24.0),
                topLeft: Radius.circular(24.0)),
            boxShadow: [
              BoxShadow(
                spreadRadius: 0.1,
                blurRadius: 25,
                color: bgWhite,
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const SizedBox(
                width: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Price",
                    style: textStyle1,
                  ),
                  Text(
                    "\$ 849.96",
                    style: textStyle4,
                  ),
                ],
              ),
              const Spacer(),
              Bounce(
                onPressed: () {},
                duration: const Duration(milliseconds: 200),
                child: Container(
                  width: 165.0,
                  height: 55.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: customBlue,
                      borderRadius: BorderRadius.circular(50.0),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 1,
                          blurRadius: 5,
                          color: customBlue,
                        )
                      ]),
                  child: const Text(
                    "Add To Cart",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontFamily: "airbnb"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
