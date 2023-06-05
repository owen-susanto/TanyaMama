import 'dart:ffi';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tanya_mama/basics/widgets/core_stateful_widget.dart';
import 'package:flutter_tanya_mama/configs/configs.dart';
import 'package:flutter_tanya_mama/constants/page_name.dart';
import 'package:flutter_tanya_mama/functions/loading_function.dart';
import 'package:flutter_tanya_mama/functions/routes.dart';
import 'package:flutter_tanya_mama/functions/toast_helper.dart';
import 'package:flutter_tanya_mama/widgets/base_raised_button.dart';
import 'package:flutter_tanya_mama/widgets/custom/custom_check_box_with_rich_text.dart';
import 'package:flutter_tanya_mama/widgets/link_text_span.dart';
import 'package:flutter_tanya_mama/widgets/normal_form_field.dart';
import 'package:flutter_tanya_mama/widgets/password_normal_form_field.dart';

class HomePage extends CoreStatefulWidget {
  const HomePage({super.key});

  @override
  CoreStatefulWidgetState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends CoreStatefulWidgetState<HomePage> {
  late FocusNode _emailFocusNode;
  late FocusNode _passwordFocusNode;
  late FocusNode _confirmPasswordFocusNode;

  late TextEditingController _emailTextEditingController;
  late TextEditingController _passwordTextEditingController;
  late TextEditingController _confirmPasswordTextEditingController;

  bool accepted = false;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _confirmPasswordFocusNode = FocusNode();
    _emailTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();
    _confirmPasswordTextEditingController = TextEditingController();

    _formKey = GlobalKey<FormState>();

    super.initState();
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    _emailTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    _confirmPasswordTextEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          NormalFormField(
            informationText: "Mohon Pastikan kamu mengisi alamat email.",
            hintText: "ex. xx@gmail.com",
            labelText: "Email",
            text: _emailTextEditingController.text,
            suffixIcon: const Icon(Icons.person, size: 20),
            keyboardType: TextInputType.name,
            onChanged: (val) => _emailTextEditingController.text = val,
            focusNode: _emailFocusNode,
            onFieldSubmitted: (_) =>
                FocusScope.of(context).requestFocus(_passwordFocusNode),
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 20),
          PasswordNormalFormField(
            hintText: "ex. ******",
            labelText: "Password",
            text: _passwordTextEditingController.text,
            onChanged: (val) => _passwordTextEditingController.text = val,
            focusNode: _passwordFocusNode,
            onFieldSubmitted: (_) =>
                FocusScope.of(context).requestFocus(_confirmPasswordFocusNode),
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 20),
          PasswordNormalFormField(
            hintText: "ex. ******",
            labelText: 'Konfirmasi Password',
            text: _confirmPasswordTextEditingController.text,
            onChanged: (val) =>
                _confirmPasswordTextEditingController.text = val,
            focusNode: _confirmPasswordFocusNode,
            onFieldSubmitted: (_) async => await register(context),
            textInputAction: TextInputAction.done,
          ),
          const SizedBox(height: 30),
          CustomCheckBoxWithRichText(
            [
              TextSpan(
                text: "Saya setuju dengan ",
                style: TextStyle(fontSize: 14 * fontRatio),
              ),
              LinkTextSpan(
                text: "Syarat & Ketentuan",
                url: "https://pakkj.app/terms.html",
                style: TextStyle(
                  color: Configs.secondaryColor,
                  decoration: TextDecoration.underline,
                  fontSize: 14 * fontRatio,
                ),
              ),
              TextSpan(
                text: " dan ",
                style: TextStyle(fontSize: 14 * fontRatio),
              ),
              LinkTextSpan(
                text: "Kebijakan Privasi",
                url: "https://pakkj.app/privacy.html",
                style: TextStyle(
                  color: Configs.secondaryColor,
                  decoration: TextDecoration.underline,
                  fontSize: 14 * fontRatio,
                ),
              ),
              TextSpan(
                text: " penggunaan aplikasi ini",
                style: TextStyle(fontSize: 14 * fontRatio),
              ),
            ],
            initialValue: accepted,
            onChanged: (val) => setState(() {
              accepted = val;
            }),
          ),
          const SizedBox(height: 45),
          Center(
            child: SizedBox(
              height: 50,
              child: BaseRaisedButton(
                ratio: 1 / 1.25,
                onPressed: () async => await register(context),
                color: Configs.secondaryColor,
                child: const Text(
                  "SIMPAN",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Future<void> register(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    if (!(_confirmPasswordTextEditingController.text ==
        _passwordTextEditingController.text)) {
      return ToastHelper.showException("Password tidak sama..", context);
    }
    if (!accepted) {
      return ToastHelper.showException("Persetujuan belum diterima..", context);
    }

    try {
      LoadingFunction.showLoadingDialog(context);

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailTextEditingController.text,
          password: _passwordTextEditingController.text);

      LoadingFunction.closeLoadingDialog(context);

      Routes.pushReplacement(context, PageName.Home);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        LoadingFunction.closeLoadingDialog(context);
        ToastHelper.showException("Password Terlalu Lemag..", context);
      } else if (e.code == 'email-already-in-use') {
        LoadingFunction.closeLoadingDialog(context);
        ToastHelper.showException("Akun sudah ada..", context);
      } else {
        LoadingFunction.closeLoadingDialog(context);
        ToastHelper.showException("Terjadi Kesalahan, Coba lagi..", context);
      }
    } catch (err) {
      LoadingFunction.closeLoadingDialog(context);
      ToastHelper.showException("Terjadi Kesalahan, Coba lagi..", context);
    }
  }
}

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();
String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
