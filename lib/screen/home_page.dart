import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:flutterprojects/Styles/color.dart';
import 'package:flutterprojects/Styles/font_styles.dart';
import 'package:flutterprojects/customwidget/BottomScreenSheet.dart';
import 'package:flutterprojects/routes/Routes.dart';
import 'package:get/get.dart';

import 'brands.dart';
import 'item_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int navigationIndex = 0;
  setBottomBarIndex(index) {
    setState(() {
      navigationIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: bgWhite,
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(
            children: [
              SizedBox(
                height: 55,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Bounce(
                          onPressed: () => ZoomDrawer.of(context)!.toggle(),
                          duration: const Duration(milliseconds: 500),
                          child: Image.asset(
                            "assets/icons/menu_ic.png",
                            width: 44,
                            height: 44,
                          )),
                      const Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Store location",
                            style: textStyle1,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "assets/icons/location_ic.png",
                                width: 14,
                                height: 14.0,
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Text("Mondolibug, Sylhet", style: textStyle2),
                            ],
                          )
                        ],
                      ),
                      const Spacer(),
                      Bounce(
                        onPressed: () {
                          BottomScreenSheet.showFilterBottomSheet(context);
                        },
                        duration: const Duration(milliseconds: 500),
                        child: Stack(
                          children: [
                            Image.asset(
                              "assets/icons/cart_ic.png",
                              width: 44.0,
                              height: 44.0,
                            ),
                            Positioned(
                              right: 0,
                              top: 5,
                              child: Container(
                                width: 10.0,
                                height: 10.0,
                                decoration: BoxDecoration(
                                    color: Colors.deepOrange,
                                    borderRadius: BorderRadius.circular(100.0)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20),
                        child: SizedBox(
                            width: double.infinity,
                            height: 48.0,
                            child: TextFormField(
                              cursorColor: customBlue,
                              cursorWidth: 2.5,
                              style: textStyle1,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                contentPadding: EdgeInsets.zero,
                                hintText: "Looking for shoes",
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child:
                                      Image.asset("assets/icons/search_ic.png"),
                                ),
                                hintStyle: textStyle1,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                              ),
                              onTap: () => Get.toNamed(Routes.searchPage),
                            )),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20,right: 20),
                        child:  SizedBox(
                          width: double.infinity,
                          height: 50.0,
                          child: Brands(),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Popular Shows",
                              style: textStyle4,
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "See all",
                                  style: textStyle5,
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 200.0,
                        child: ListView.builder(
                            itemCount: 10,
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              return ItemView(
                                currentIndex: index,
                              );
                            }),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "New Arrivals",
                              style: textStyle4,
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "See all",
                                  style: textStyle5,
                                ))
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          for (int i = 0; i < 5; i++)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  width: double.infinity,
                                  height: 120,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.0),
                                      color: Colors.white),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "BEST CHOICE",
                                              style: textStyle6,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "Nike Air Jordan",
                                              style: textStyle4,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "\$ 849.69",
                                              style: textStyle4,
                                            ),
                                          ],
                                        ),
                                      )),
                                      Expanded(
                                          child: Image.asset(
                                        "assets/shows/img1.png",
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                      )),
                                    ],
                                  ),
                                ),
                              ),
                            )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 70.0),
        child: SizedBox(
          width: 56.0,
          height: 56.0,
          child: FloatingActionButton(
            onPressed: () {
              Get.toNamed(Routes.cart);
            },
            backgroundColor: customBlue,
            elevation: 10,
            child: Image.asset(
              "assets/icons/bag_ic.png",
              width: 20.0,
              height: 20.0,
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 100,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bottomnav_bg.png"),
                fit: BoxFit.fitWidth)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    navigationIndex = 0;
                    Get.offNamed(Routes.home);
                  },
                  child: Image.asset("assets/icons/home_ic.png",
                      width: 25,
                      height: 25,
                      color: navigationIndex == 0 ? customBlue : customGrey),
                ),
                InkWell(
                  onTap: () {
                    navigationIndex = 1;
                    Get.toNamed(Routes.favourite);
                  },
                  child: Image.asset("assets/icons/favourite_ic.png",
                      width: 25,
                      height: 25,
                      color: navigationIndex == 1 ? customBlue : customGrey),
                ),
                const SizedBox(
                  width: 60.0,
                ),
                InkWell(
                  onTap: () {
                    navigationIndex = 2;
                    Get.toNamed(Routes.notification);
                  },
                  child: Image.asset("assets/icons/notify_ic.png",
                      width: 25,
                      height: 25,
                      color: navigationIndex == 2 ? customBlue : customGrey),
                ),
                InkWell(
                  onTap: () {
                    navigationIndex = 3;
                    Get.toNamed(Routes.profile);
                  },
                  child: Image.asset("assets/icons/user_ic.png",
                      width: 25,
                      height: 25,
                      color: navigationIndex == 3 ? customBlue : customGrey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
