import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tanya_mama/basics/screens/base_screen_with_app_bar.dart';
import 'package:flutter_tanya_mama/constants/page_name.dart';
import 'package:flutter_tanya_mama/functions/routes.dart';
import 'package:flutter_tanya_mama/screens/home/home_page.dart';
import 'package:flutter_tanya_mama/screens/register/register_page.dart';
import 'package:flutter_tanya_mama/widgets/custom/custom_text.dart';

class HomeScreen extends BaseScreenWithAppBar {
  const HomeScreen({super.key}) : super(PageName.Home);
  @override
  // TODO: implement scrollable
  bool get scrollable => false;
  @override
  Widget content(BuildContext context) {
    return const HomePage();
  }

  @override
  AppBar appBar(BuildContext context) {
    return AppBar(
      title: const CustomText("Home", fontSize: 20),
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      scrolledUnderElevation: 0,
      iconTheme: const IconThemeData(color: Colors.black),
      actions: [
        IconButton(
          onPressed: () => Routes.push(
            context,
            PageName.Tutorial,
            arguments: {"section": "register"},
          ),
          icon: const Icon(Icons.question_mark_rounded),
        ),
      ],
    );
  }
}
