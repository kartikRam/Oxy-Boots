import 'package:flutterprojects/colors/Colors.dart';
import 'package:flutterprojects/models/Product.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{
  final RxList<Product> products = [
    Product(
        name: 'Nike Jordan',
        price: 493.00,
        image: 'assets/images/appbar/shoe1.png', quantity: 1, colorsAvail: ShoesColors.nikeJordan),
    Product(
        name: 'Nike Air Max',
        price: 37.8,
        image: 'assets/images/appbar/shoe2.png', quantity: 1,colorsAvail: ShoesColors.nikeAirMax),
    Product(
        name: 'Nike Club Max',
        price: 47.7,
        image: 'assets/images/appbar/shoe3.png', quantity: 1,colorsAvail: ShoesColors.nikeClubMax),
    Product(
        name: 'Nike Air Max',
        price: 57.6,
        image: 'assets/images/appbar/shoe3.png', quantity: 1,colorsAvail: ShoesColors.nikeAirMax2),

    // Add more products here
  ].obs;
}