// import 'package:flutter/material.dart';
//
// class NotificationsScreen extends StatefulWidget {
//   const NotificationsScreen({Key? key}) : super(key: key);
//
//   @override
//   State<NotificationsScreen> createState() => _NotificationsScreenState();
// }
//
// class _NotificationsScreenState extends State<NotificationsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: const Color(0xffF8F9FA),
//         body: Column(children: [
//           const SizedBox(
//             height: 50,
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 InkWell(
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                   child: Container(
//                     width: 45,
//                     height: 45,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(30.0),
//                       image: const DecorationImage(
//                         image: AssetImage("assets/icons/back_ic.png"),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const Text(
//                   'Notification',
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500),
//                 ),
//                 InkWell(
//                   child: Container(
//                     width: 45,
//                     height: 45,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(30.0),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ]));
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/Routes.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Notification'),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.chevron_left, size: 30),
            onPressed: () {
              // Navigate back or close the page
              Get.back();
            },
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text(
                "Clear All",
                style: TextStyle(color: Colors.blueAccent, fontSize: 18),
              ),
            ),
          ],
          // backgroundColor: Colors.white,
        ),
        // backgroundColor: const Color(0xffF8F9FA),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            // Today Section
            _buildSectionHeader('Today'),
            _buildProductListItem('Product A', 'assets/images/addcardpageimage/shoes1.png', '\$364.95', '\$260.00', '5 min ago'),
            _buildProductListItem('Product B', 'assets/images/addcardpageimage/shoes1.png', '\$364.95', '\$260.00', '16 min ago'),

            // Yesterday Section
            _buildSectionHeader('Yesterday'),
            listItemYeasterday('Product C', 'assets/images/addcardpageimage/shoes1.png', '\$80', '\$65'),
            listItemYeasterday('Product D', 'assets/images/addcardpageimage/shoes1.png', '\$90', '\$75'),
          ],
        )
    );

  }
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildProductListItem(String productName, String imagePath, String price, String otherPrice, String minitIn) {
    return ListTile(
      leading: Image.asset(
        imagePath,
        width: 80.0,
        height: 80.0,
        fit: BoxFit.cover,
      ),
      title: Text(productName),
      subtitle: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$price ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(otherPrice),
        ],
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(minitIn), // Show some time ago (e.g., 5 min)
          const SizedBox(height: 5),
          SizedBox(
            width: 8.0,
            height: 8.0,
            child: Container(
              decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),color : Colors.blueAccent),
              // color: Colors.blueAccent,
            ),

          ), // Blue tick icon
        ],
      ),
    );
  }

  Widget listItemYeasterday(String productName, String imagePath, String price, String otherPrice) {
    return ListTile(
      leading: Image.asset(
        imagePath,
        width: 80.0,
        height: 80.0,
        fit: BoxFit.cover,
      ),
      title: Text(productName),
      subtitle: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$price ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(otherPrice),
        ],
      ),
      trailing: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('5 min ago'), // Show some time ago (e.g., 5 min)
          SizedBox(height: 5),
          // Blue tick icon
        ],
      ),
    );
  }
  void clearAllNotifications() {}
}

