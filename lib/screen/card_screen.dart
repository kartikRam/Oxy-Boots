
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterprojects/controller/CartController.dart';
import 'package:flutterprojects/customwidget/CustomeButton.dart';
import 'package:flutterprojects/models/Product.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../routes/Routes.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late CartController cartControllerObj ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.put(CartController());
    cartControllerObj= Get.find<CartController>();
    cartControllerObj.calculateTotal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Text('My Cart'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left,size: 30),
          onPressed: () {
            // Navigate back or close the page
             Get.back();
          },
        ),
      ),
      body: GetBuilder<CartController>(
          id: "kery",
          builder: (context) {
            return ListView.builder(
              itemCount: cartControllerObj.products.length,
              itemBuilder: (context, index) {
                final product = cartControllerObj.products[index];
                return  ListTile(
                  leading: Image.asset(
                    'assets/${cartControllerObj.products[index].image}',
                    width: 87,
                    height: 85,
                    fit: BoxFit.fill,
                  ),
                  title: Text(cartControllerObj.products[index].name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('\$${cartControllerObj.products[index].price.toStringAsFixed(2)}'),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              // Decrease quantity
                              if(cartControllerObj.products[index].quantity>1){
                                cartControllerObj.setQuantity(false, index);
                              }else{
                                Get.snackbar("Error", "Sorry, you can't decrement further");
                              }
                            },

                          ),
                          Text(cartControllerObj.products[index].quantity.toString()), // Display quantity here
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              // Increase quantity
                              cartControllerObj.setQuantity(true, index);
                              print("In the ObX ${cartControllerObj.products[index].quantity}");
                              /*  setState(() {

                                });*/
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  trailing: SizedBox(
                    width: 30, // Width of the custom delete button
                    height: 30, // Height of the custom delete button
                    child: InkWell(
                      onTap: () async {
                        await showDeleteConfirmationDialog(product,index);
                      },
                      child: Image.asset(
                        'assets/images/addcardpageimage/DeleteButton.png',
                        width: 24, // Size of the delete button icon within the image
                        height: 24, // Size of the delete button icon within the image
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                );
              },

            );
          }
      ),
      bottomNavigationBar: GetBuilder<CartController>(
        id: 'Key',
        builder: (context) {
          return Container(
            height: 250,
            child: BottomAppBar(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(children: [
                      const Text(
                        'Subtotal',
                        style: TextStyle(fontSize: 16),
                      ),
                      Expanded(child: Container()),
                      Text(
                        '\$${cartControllerObj.subtotal.value.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      )
                    ]),
                    const SizedBox(height: 15),
                    Row(children: [
                      const Text(
                        'Shipping',
                        style: TextStyle(fontSize: 16),
                      ),
                      Expanded(child: Container()),
                      const Text(
                        '\$40.90',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      )
                    ]),
                    const SizedBox(height: 15),
                    const Divider(),
                    const SizedBox(height: 18),
                    Row(children: [
                      const Text(
                        'Total',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Expanded(child: Container()),
                      Text(
                        '\$${cartControllerObj.total.value.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      )
                      // Text('Total: \$XX.XX',
                      //   style: TextStyle(fontWeight: FontWeight.bold)),
                    ]),
                    const SizedBox(height: 10),
                    CustomButton(
                        btnText: "Checkout",
                        callback: () {Get.toNamed(Routes.checkOut);}
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );

  }


  Future<Future<bool?>> showDeleteConfirmationDialog(Product product,int index) async {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Deletion'),
          content: Text('Are you sure you want to delete ${product.name} from your cart?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cancel
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                cartControllerObj.removeQuantity(index);
                Navigator.of(context).pop();
                /* setState(() {

                });*/// Confirm
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

}


