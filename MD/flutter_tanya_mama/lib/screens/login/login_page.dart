import 'package:flutter/material.dart';
import 'package:flutter_tanya_mama/basics/widgets/core_stateful_widget.dart';

import 'package:flutter_tanya_mama/functions/routes.dart';
import 'package:flutter_tanya_mama/constants/page_name.dart';
import 'package:flutter_tanya_mama/configs/configs.dart';
import 'package:flutter_tanya_mama/widgets/base_raised_button.dart';
import 'package:flutter_tanya_mama/widgets/custom/custom_text.dart';
import 'package:flutter_tanya_mama/widgets/normal_form_field.dart';
import 'package:flutter_tanya_mama/widgets/password_normal_form_field.dart';

class LoginPage extends CoreStatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends CoreStatefulWidgetState<LoginPage> {
  late FocusNode _emailFocusNode;
  late FocusNode _passwordFocusNode;
  late TextEditingController _emailTextEditingController;
  late TextEditingController _passwordTextEditingController;
  @override
  void initState() {
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _emailTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();

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
              CustomText(
                'Belum Punya Akun ?',
                fontWeight: FontWeight.w400,
                fontSize: 15 * fontRatio,
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
                child: Text(
                  'Registrasi Dulu',
                  style: TextStyle(
                    fontSize: 15 * fontRatio,
                    color: Configs.secondaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 25.0),
          NormalFormField(
            hintText: "ex. abc@gmail.com",
            labelText: "Alamat E-Mail",
            controller: _emailTextEditingController,
            suffixIcon: const Icon(Icons.email, size: 20),
            keyboardType: TextInputType.emailAddress,
            onChanged: (val) => _emailTextEditingController.text = val,
            focusNode: _emailFocusNode,
            onFieldSubmitted: (_) =>
                FocusScope.of(context).requestFocus(_passwordFocusNode),
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 20),
          PasswordNormalFormField(
            controller: _passwordTextEditingController,
            labelText: "Password",
            hintText: "ex. ******",
            onChanged: (val) => _emailTextEditingController.text = val,
            focusNode: _passwordFocusNode,
            onFieldSubmitted: (_) async => await login(context),
            textInputAction: TextInputAction.done,
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => Routes.push(context, PageName.ForgetPassword),
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
              child: Text(
                "Lupa Password?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Configs.secondaryColor,
                  fontSize: 14 * fontRatio,
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
