import 'package:flutter/material.dart';
import 'package:flutterprojects/colors/Colors.dart';
import 'package:flutterprojects/controller/AuthController.dart';
import 'package:flutterprojects/customwidget/CustomTextField.dart';
import 'package:flutterprojects/customwidget/CustomeButton.dart';
import 'package:flutterprojects/customwidget/LabelWidget.dart';
import 'package:flutterprojects/routes/Routes.dart';
import 'package:flutterprojects/statictext/StaticText.dart';
import 'package:get/get.dart';


class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  final AuthController authService = AuthController();
  RxBool _isPasswordVisible = false.obs;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _signUp(BuildContext context) async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      Get.snackbar('Signup Failed', 'Please enter a valid email address');
      return;
    }
    if (email.isEmpty || password.isEmpty) {
      // Show error message if username or password is empty
      Get.snackbar('Signup Failed', 'Please fill in all fields');
      return;
    }

    await authService.signUp(email, password);


    Get.offNamed(Routes.login);
  }
  void _togglePasswordVisibility() {

    _isPasswordVisible.value = !_isPasswordVisible.value;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.toNamed(Routes.login);
            },
            icon: const Icon(Icons.chevron_left, size: 30),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _header(context),
                _inputField(context),
                _signup(context)
              ],
            ),
          ),
        ));
  }




  _header(context) {
    return const Column(
      children: [
        Text(
          StaticText.signupHeaderTopName,
          style: TextStyle(
              fontSize: 28,
              fontFamily: 'AirbnbCereal',
              fontWeight: FontWeight.bold),
        ),
        Text(
          StaticText.signupHeaderTitleName,
          style: TextStyle(fontFamily: 'AirbnbCereal'),
        ),
      ],
    );
  }

  _inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const LabelWidget(labelName: StaticText.nameOfSignUp),
        const SizedBox(height: 6),
        const CustomTextField(hintText: StaticText.nameOfSignUp),
        const SizedBox(height: 10),
        const LabelWidget(labelName: StaticText.labelUserName),
        const SizedBox(height: 6),
        CustomTextField(hintText: StaticText.labelUserName,textContreller: _emailController,),
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
        const SizedBox(height: 10),
        CustomButton(
          btnText: StaticText.signupButtonName,
          callback: () {_signUp(Get.context!);},
        ),
        const SizedBox(height: 30),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Image(
              image: AssetImage("assets/images/loginpage/googlelogo.png"),
              width: 24,
              height: 24),
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


  _signup(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already Have An Account?"),
        TextButton(
            onPressed: () {
              Get.toNamed(Routes.login);
            },
            child: const Text(
              "Sign In",
              style: TextStyle(color: Colors.black),
            ))
      ],
    );
  }
}
