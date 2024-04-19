import 'package:flutterprojects/customwidget/ShoeSearchPage.dart';
import 'package:flutterprojects/screen/AccountSetting.dart';
import 'package:flutterprojects/screen/CheckoutPage.dart';
import 'package:flutterprojects/screen/ForgotPassword.dart';
import 'package:flutterprojects/screen/LoginPage.dart';
import 'package:flutterprojects/screen/SignupPage.dart';
import 'package:flutterprojects/screen/card_screen.dart';
import 'package:flutterprojects/screen/favourite_screen.dart';
import 'package:flutterprojects/screen/home_page.dart';
import 'package:flutterprojects/screen/main_screen.dart';
import 'package:flutterprojects/screen/notifications_screen.dart';
import 'package:flutterprojects/screen/product_view.dart';
import 'package:flutterprojects/screen/profile.dart';
import 'package:flutterprojects/screen/splash_screen.dart';
import 'package:flutterprojects/screen/started-pages/OnBoardingPageView.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class Routes {
  //login and signup and forgot password
  static String login = '/Login';
  static String register = '/Signup';
  static String forgotPassword = '/ForgotPassword';
  static String splashScreen = '/SplashScreen';
  static String onBoardPageView = '/onBoardPageView';
  static String dashboard = '/dashboard';
  static String favourite = '/Favourite';
  static String notification = '/Notification';
  static String profile = '/Profile';
  static String productView = '/ProductView';
  static String home = "/Home";
  static String cart = "/cart";
  static String checkOut = '/CheckoutPage';
  static String accountSetting = '/AccountSetting';
  static String searchPage = '/SearchPage';
}

final getPages = [
  //login
  GetPage(
    name: Routes.login,
    page: () => LoginPage(),
  ),
  //signup
  GetPage(
    name: Routes.register,
    page: () => SignupPage(),
  ),
  //forgot password
  GetPage(
      name: Routes.forgotPassword,
      page: () => const ForgotPassword(),
  ),

  GetPage(
    name: Routes.splashScreen,
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: Routes.productView,
    page: () => const ProductView(),
  ),
  GetPage(
    name: Routes.checkOut,
    page: () => CheckoutPage(),
  ),
  GetPage(
    name: Routes.cart,
    page: () => CartScreen(),
  ),
  GetPage(
    name: Routes.onBoardPageView,
    page: () => const OnBoardingPageView(),
  ),
  GetPage(
    name: Routes.dashboard,
    page: () => const MainScreen(),
  ),
  GetPage(
    name: Routes.favourite,
    page: () => const FavouriteScreen(),
  ),
  GetPage(
    name: Routes.home,
    page: () => const HomePage(),
  ),
  GetPage(
    name: Routes.notification,
    page: () => const NotificationsScreen(),
  ),
  GetPage(
    name: Routes.profile,
    page: () => const ProfileScreen(),
  ),
  GetPage(
    name: Routes.accountSetting,
    page: () => const AccountSettingsScreen(),
  ),
  GetPage(
    name: Routes.searchPage,
    page: () => ShoeSearchPage(),
  ),
];
