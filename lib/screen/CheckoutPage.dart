import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterprojects/colors/Colors.dart';
import 'package:flutterprojects/controller/CartController.dart';
import 'package:flutterprojects/customwidget/CustomeButton.dart';
import 'package:flutterprojects/models/Contact.dart';
import 'package:flutterprojects/routes/Routes.dart';
import 'package:get/get.dart';

class CheckoutPage extends StatelessWidget {
  CartController cartControllerObj = Get.find<CartController>();

  CheckoutPage ({super.key});
  final List<Contact> contact = [
    Contact(
        seimage: 'assets/images/addcardpageimage/emailicon.png',
        name: 'rumenhuseen@gmail.com',
        price: "Email",
        image: 'assets/images/addcardpageimage/editButton.png'),
    Contact(
        seimage: 'assets/images/addcardpageimage/callicon.png',
        name: '+88-692-764-269',
        price: "Phone",
        image: 'assets/images/addcardpageimage/editButton.png'),
  ];
  final String email = 'example@example.com';
  final String phone = '+1234567890';
  final String address = 'Newahall St 36,London, 1298-Uk';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Contact Information", style: TextStyle(fontWeight: FontWeight.bold),),
                _buildContactInfo(),
                const SizedBox(height: 20.0),
                _buildAddress(),
                const SizedBox(height: 20.0),
                _buildPaymentMethod(),
              ],
            ),
      ),
      bottomNavigationBar: SizedBox(
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
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )
                  // Text('Total: \$XX.XX',
                  //   style: TextStyle(fontWeight: FontWeight.bold)),
                ]),
                const SizedBox(height: 10),
                CustomButton(
                    btnText: "Payment",
                callback: () => _dialogBuilder(context),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildContactInfo() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: contact.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Image.asset(
            '${contact[index].seimage}',
            width: 20,
            height: 20,
            fit: BoxFit.fill,
          ),
          title: Text(contact[index].name),
          subtitle:
            // crossAxisAlignment: CrossAxisAlignment.start,
            Text(contact[index].price),
          trailing: Image.asset(
            '${contact[index].image}',
            width: 20,
            height: 20,
          ),
        );
      },
    );
  }
  Widget _buildAddress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Address:',
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),
        ),
        const SizedBox(height: 5.0),
        Row(
          children: [
            InkWell(
              onTap: () {
                // Implement dropdown functionality
              },
              child: Text(
                address,
                style: const TextStyle(fontSize: 16.0, color: Colors.black),
              ),
            ),
            Expanded(child: Container()),
            const Icon(Icons.arrow_drop_down_outlined),
          ],
        ),

        const SizedBox(height: 10.0),
        // Placeholder for static map
        SizedBox(
          height: 100.0,
          width: double.infinity,
          child: Ink.image(image: const AssetImage("assets/images/mapimage.png")),
        ),
      ],
    );
  }
  Widget _buildPaymentMethod() {
    return Row(
      children: [
        const Icon(Icons.payment),
        const SizedBox(width: 10.0),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Payment Method',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 5.0),
              Text(
                '**** 1234', // Display last 4 digits of card
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.arrow_drop_down),
          onPressed: () {
            // Implement dropdown for selecting payment method
          },
        ),
      ],
    );
  }
  Future<void> _dialogBuilder(BuildContext context)async{
    showDialog<String>(context: context, builder: (BuildContext context) {
      return Dialog(
        child: Container(
          color: Colors.white,
          height: 300,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                      Center(
                        child: Stack(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: ShoesColors.dialogBgColor,
                              ),
                            ),
                            const Positioned(left: 20,top:10,child: Image(image: AssetImage("assets/images/dialogimg.png"),width: 70,height: 70,))
                          ],
                        ),
                      ),
                      const Center(
                        child: Text("Your Payment is Successful",
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      ),
                      Center(
                        child: CustomButton(btnText: "  Back to Shopping  ", callback: (){
                          Get.offNamedUntil(Routes.dashboard, (route) => false);
                        }),
                      ),
              ],
            ),
          ),
        ),
      );
    });
  }
}




