import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterprojects/colors/Colors.dart';
import 'package:flutterprojects/models/Product.dart';

class CustomCardFavourite extends StatefulWidget {
  final int index;
  final Product objProduct;

  CustomCardFavourite(
      {super.key, required this.index, required Product this.objProduct});

  @override
  State<CustomCardFavourite> createState() => _CustomCardFavouriteState();
}

class _CustomCardFavouriteState extends State<CustomCardFavourite> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 100,
            child: Stack(
              children: [
                Center(
                    child: Image(
                  image: AssetImage(widget.objProduct.image),
                  width: 125,
                  height: 81,
                )),
                Container(
                    alignment: Alignment.topLeft,
                    child: const Image(
                        image:
                            AssetImage("assets/images/favourite.png"),
                        width: 36,
                        height: 36)),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 13.0),
            child: Text(
              "BEST SELLER",
              style:
                  TextStyle(color: ShoesColors.loginButtonColor, fontSize: 14),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 13.0),
            child: Text(
              widget.objProduct.name,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right:40),
                  child: Text(
                    "\$${widget.objProduct.price}",
                    style: const TextStyle(
                        color: ShoesColors.loginButtonColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                    alignment: Alignment.bottomRight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: widget.objProduct.colorsAvail[0],
                    ),
                    width: 16,
                    height: 16),
                Padding(
                  padding: const EdgeInsets.only(left:8.0,right: 8),
                  child: Container(
                      alignment: Alignment.bottomRight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: widget.objProduct.colorsAvail[1],
                      ),
                      width: 16,
                      height: 16),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
