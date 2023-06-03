import 'package:flutter/material.dart';
import 'package:flutter_tanya_mama/basics/screens/base_screen.dart';
import 'package:flutter_tanya_mama/constants/page_name.dart';
import 'package:flutter_tanya_mama/screens/introduction/introduction_page.dart';

class IntroductionScreen extends BaseScreen {
  const IntroductionScreen({super.key})
      : super(PageName.Introduction, padding: EdgeInsets.zero);

  @override
  Widget content(BuildContext context) {
    return const IntroductionPage();
  }
}
