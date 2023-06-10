import 'package:flutter/material.dart';
import 'package:flutter_tanya_mama/basics/screens/base_screen.dart';
import 'package:flutter_tanya_mama/constants/page_name.dart';
import 'package:flutter_tanya_mama/screens/register/register_page.dart';

class RegisterScreen extends BaseScreen {
  const RegisterScreen({super.key}) : super(PageName.Register);

  @override
  Widget content(BuildContext context) {
    return const RegisterPage();
  }
}
