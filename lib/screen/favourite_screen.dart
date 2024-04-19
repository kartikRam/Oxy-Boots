import 'package:flutter/material.dart';
import 'package:flutterprojects/controller/ProductController.dart';
import 'package:flutterprojects/customwidget/CustomCardFavourite.dart';
import 'package:get/get.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  ProductController productControllerObj = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF8F9FA),
        body: Column(children: [
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                      image: const DecorationImage(
                        image: AssetImage("assets/icons/back_ic.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const Text(
                  'Favourite',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                InkWell(
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: const Image(image:AssetImage("assets/images/favourite.png")),

                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              // Create a grid with 2 columns
              crossAxisCount: 2,
              // Generate 20 widgets that display their index in the List
              children: List.generate(productControllerObj.products.length, (index) {
                return Container(margin:const EdgeInsets.all(10),height:200,child:
                CustomCardFavourite(index: index,
                    objProduct: productControllerObj.products[index]));
              }),
            ),
          ),
        ]));
  }
}
