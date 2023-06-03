import 'package:flutter/material.dart';
import 'package:flutter_tanya_mama/basics/screens/base_screen.dart';
import 'package:flutter_tanya_mama/constants/page_name.dart';
import 'package:flutter_tanya_mama/screens/login/login_page.dart';

class LoginScreen extends BaseScreen {
  const LoginScreen({super.key}) : super(PageName.Login);

  @override
  Widget content(BuildContext context) {
    return const LoginPage();
  }
}
