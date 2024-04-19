// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:flutterprojects/generated/menu_item.dart';
import 'package:flutterprojects/screen/card_screen.dart';
import 'package:flutterprojects/screen/drawer_main_screen.dart';
import 'package:flutterprojects/screen/favourite_screen.dart';
import 'package:flutterprojects/screen/home_page.dart';
import 'package:flutterprojects/screen/notifications_screen.dart';
import 'package:flutterprojects/screen/profile.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  MenuItemClass currentItem = MenuItems.home;

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      slideWidth: 240,
      style: DrawerStyle.Style1,
      mainScreen: getScreen(),
      menuScreen: Builder(builder: (context) {
        return MenuScreen(
          currentItem: currentItem,
          onSelectedItem: (item) {
            setState(() {
              currentItem = item;
              ZoomDrawer.of(context)!.close();
            });
          },
        );
      }),
    );
  }

  Widget getScreen() {
    switch (currentItem) {
      case MenuItems.home:
        return const HomePage();
      case MenuItems.profile:
        return const ProfileScreen();
      case MenuItems.cart:
        return CartScreen();
      case MenuItems.favourite:
        return const FavouriteScreen();
      case MenuItems.notification:
        return const NotificationsScreen();
    }
    return Container();
  }
}
