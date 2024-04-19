import 'package:flutter/material.dart';
import 'package:flutterprojects/colors/Colors.dart';
import 'package:flutterprojects/customwidget/CustomTextField.dart';
import 'package:flutterprojects/customwidget/CustomeButton.dart';
import 'package:flutterprojects/customwidget/LabelWidget.dart';
import 'package:flutterprojects/statictext/StaticText.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import '../controller/AuthController.dart';
import '../routes/Routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthController authService = AuthController();
  RxBool _isPasswordVisible = false.obs;

  Future<void> _login(BuildContext context) async {
    String username = _emailController.text;
    String password = _passwordController.text;
    if (username.isEmpty || password.isEmpty) {
      Get.snackbar('Login Failed', 'Please enter username and password');
      return;
    }
    bool success = await authService.login(username, password);
    if (success) {
      Get.toNamed(Routes.dashboard);
    } else {
      Get.snackbar('Login Failed', 'Invalid username or password');
    }
  }

  void _togglePasswordVisibility() {
    // setState(() {
    _isPasswordVisible.value = !_isPasswordVisible.value;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, size: 30),
          onPressed: () {
            Get.toNamed("");
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _header(context),
              const SizedBox(height: 40),
              _inputField(context),
              const SizedBox(height: 50),
              _signup(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header(context) {
    return const Column(
      children: [
        Text(
          StaticText.loginHeaderTopName,
          style: TextStyle(
            fontSize: 28,
            fontFamily: 'AirbnbCereal',
            fontWeight: FontWeight.bold,
            color: Color(0xff1A2530),
          ),
        ),
        Text(
          StaticText.loginHeaderTitleName,
          style: TextStyle(fontFamily: 'AirbnbCereal'),
        ),
      ],
    );
  }

  Widget _inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const LabelWidget(labelName: StaticText.labelUserName),
        const SizedBox(height: 6),
        CustomTextField(
            hintText: StaticText.labelUserName,
            textContreller: _emailController),
        const SizedBox(height: 10),
        const LabelWidget(labelName: StaticText.labelPassword),
        const SizedBox(height: 6),
        Obx(
              () => TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              hintText: StaticText.labelPassword,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none,
              ),
              fillColor: ShoesColors.textBg,
              filled: true,
              suffixIcon: GestureDetector(
                onTap: _togglePasswordVisibility,
                child: Icon(
                  _isPasswordVisible.value
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Colors.grey,
                ),
              ),
            ),
            obscureText: !_isPasswordVisible.value,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                Get.toNamed('/ForgotPassword');
              },
              child: const Text(
                StaticText.forgotPassword,
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        CustomButton(
          btnText: StaticText.loginButtonName,
          callback: () {
            _login(context);
          },
        ),
        const SizedBox(height: 30),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Image(
            image: AssetImage("assets/images/loginpage/googlelogo.png"),
            width: 24,
            height: 24,
          ),
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: ShoesColors.textBg,
          ),
          label: const Text(
            "Sign in With Google",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        )
      ],
    );
  }

  Widget _signup(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't Have An Account?"),
        TextButton(
          onPressed: () {
            Get.toNamed(Routes.register);
          },
          child: const Text(
            "Sign Up For Free",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
