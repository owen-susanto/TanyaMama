import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tanya_mama/basics/screens/base_screen_with_app_bar.dart';
import 'package:flutter_tanya_mama/constants/page_name.dart';
import 'package:flutter_tanya_mama/functions/routes.dart';
import 'package:flutter_tanya_mama/screens/settings/settings_page.dart';
import 'package:flutter_tanya_mama/widgets/custom/custom_text.dart';

class SettingsScreen extends BaseScreenWithAppBar {
  const SettingsScreen({super.key}) : super(PageName.Settings);

  @override
  Widget content(BuildContext context) {
    return const SettingsPage();
  }

  static var navBarRoutes = [
    PageName.Home,
    PageName.Settings,
  ];
  EdgeInsets get padding => EdgeInsets.zero;
  @override
  Widget? bottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black87,
      unselectedItemColor: Colors.white,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Akun',
        ),
      ],
      currentIndex: 1,
      selectedItemColor: Colors.blue[400],
      onTap: (index) async {
        await Routes.pushReplacement(
          context,
          navBarRoutes[index],
        );
      },
    );
  }

  @override
  AppBar appBar(BuildContext context) {
    return AppBar(
      title: const CustomText("Akun", fontSize: 20),
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      scrolledUnderElevation: 0,
      iconTheme: const IconThemeData(color: Colors.black),
      actions: [],
    );
  }
}
