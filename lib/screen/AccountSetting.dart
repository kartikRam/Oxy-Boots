import 'package:flutter/material.dart';
import 'package:flutterprojects/Styles/font_styles.dart';
import 'package:get/get.dart';

class AccountSettingsScreen extends StatefulWidget {
  const AccountSettingsScreen({super.key});

  @override
  State<AccountSettingsScreen> createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> {
  RxBool faceId = true.obs;
  RxBool pushNotification = true.obs;
  RxBool locationService = true.obs;
  RxBool darkMode = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            size: 30,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          'Account & Settings',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 14.0),
                child: Text(
                  "Account",
                  style: textStyle18px,
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                leading: const Image(
                  image: AssetImage("assets/images/profile/notification.png"),
                  width: 24,
                  height: 24,
                ),
                title: Text(
                  "Notification Settings",
                  style: textStyle4,
                ),
                trailing: const Image(
                  image: AssetImage("assets/images/profile/rightarrow.png"),
                  width: 34,
                  height: 34,
                ),
                onTap: () {},
              ),
              const Divider(),
              ListTile(
                leading: const Image(
                  image:
                      AssetImage("assets/images/profile/shippingaddress.png"),
                  width: 24,
                  height: 24,
                ),
                title: Text(
                  "Shopping Address",
                  style: textStyle4,
                ),
                trailing: const Image(
                  image: AssetImage("assets/images/profile/rightarrow.png"),
                  width: 34,
                  height: 34,
                ),
                onTap: () {
                  // Navigate to payment info page
                },
              ),
              const Divider(),
              ListTile(
                leading: const Image(
                  image: AssetImage("assets/images/profile/payment.png"),
                  width: 24,
                  height: 24,
                ),
                title: Text(
                  "Payment Info",
                  style: textStyle4,
                ),
                trailing: const Image(
                  image: AssetImage("assets/images/profile/rightarrow.png"),
                  width: 34,
                  height: 34,
                ),
                onTap: () {
                  // Navigate to payment info page
                },
              ),
              const Divider(),
              ListTile(
                leading: const Image(
                  image: AssetImage("assets/images/profile/delete.png"),
                  width: 24,
                  height: 24,
                ),
                title: Text(
                  "Delete Account",
                  style: textStyle4,
                ),
                trailing: const Image(
                  image: AssetImage("assets/images/profile/rightarrow.png"),
                  width: 34,
                  height: 34,
                ),
                onTap: () {
                  // Show confirmation dialog for account deletion
                },
              ),
              const Divider(),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Text(
                  "App Settings",
                  style: textStyle18px,
                ),
              ),
              const SizedBox(height: 10),
              Obx(
                () => SwitchListTile(
                  activeColor: Colors.blue,
                  inactiveTrackColor: Colors.white,
                  title: Text(
                    "Enable Face ID for Login",
                    style: textStyle16px,
                  ),
                  value: faceId.value, // Set initial value here
                  onChanged: (bool value) {
                    // Implement logic for enabling/disabling Face ID
                    faceId.value = !faceId.value;
                  },
                ),
              ),
              const Divider(),
              Obx(
                () => SwitchListTile(
                  activeColor: Colors.blue,
                  inactiveTrackColor: Colors.white,
                  title:
                      Text("Enable Push Notifications", style: textStyle16px),
                  value: pushNotification.value,
                  // Set initial value here
                  onChanged: (bool value) {
                    // Implement logic for enabling/disabling push notifications
                    pushNotification.value = !pushNotification.value;
                  },
                ),
              ),
              const Divider(),
              Obx(
                () => SwitchListTile(
                  activeColor: Colors.blue,
                  inactiveTrackColor: Colors.white,
                  title: Text("Enable Location Services", style: textStyle16px),
                  value: locationService.value, // Set initial value here
                  onChanged: (bool value) {
                    // Implement logic for enabling/disabling location services
                    locationService.value = !locationService.value;
                  },
                ),
              ),
              const Divider(),
              Obx(
                () => SwitchListTile(
                  activeColor: Colors.blue,
                  inactiveTrackColor: Colors.white,
                  title: Text("Dark Mode", style: textStyle16px),
                  value: darkMode.value, // Set initial value here
                  onChanged: (bool value) {
                    // Implement logic for enabling/disabling dark mode
                    darkMode.value = !darkMode.value;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
