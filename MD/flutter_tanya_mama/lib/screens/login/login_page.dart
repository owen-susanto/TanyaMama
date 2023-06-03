import 'package:flutter/material.dart';
import 'package:flutter_tanya_mama/basics/exceptions/http_exception.dart';

import 'package:flutter_tanya_mama/functions/routes.dart';
import 'package:flutter_tanya_mama/constants/page_name.dart';
import 'package:flutter_tanya_mama/functions/loading_function.dart';
import 'package:flutter_tanya_mama/functions/toast_helper.dart';
import 'package:flutter_tanya_mama/functions/token_version.dart';
import 'package:flutter_tanya_mama/configs/configs.dart';
import 'package:flutter_tanya_mama/widgets/base_raised_button.dart';
import 'package:flutter_tanya_mama/widgets/custom/custom_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late FocusNode _emailFocusNode;
  late FocusNode _passwordFocusNode;

  @override
  void initState() {
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Image.asset("assets/pakkj.png", width: 90),
          ),
          const CustomText(
            "Login ke Akunmu.",
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                'Belum Punya Akun ?',
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: Colors.black87,
              ),
              TextButton(
                onPressed: () => Routes.push(context, PageName.Register),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  elevation: MaterialStateProperty.all<double>(0),
                  overlayColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 248, 231, 220),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.all(12.5),
                  ),
                ),
                child: const CustomText(
                  'Registrasi Dulu',
                  fontSize: 15,
                  color: Configs.primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 25.0),
          const SizedBox(height: 30),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () => Routes.push(context, PageName.ForgetPassword),
              child: const Text(
                "Lupa Password?",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                  color: Configs.secondaryColor,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const SizedBox(height: 45),
          Center(
            child: SizedBox(
              height: 50,
              child: BaseRaisedButton(
                ratio: 1 / 1.25,
                onPressed: () async => await login(context),
                color: Configs.secondaryColor,
                child: const Text(
                  "LOGIN",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Future<void> login(BuildContext context) async {}
}
