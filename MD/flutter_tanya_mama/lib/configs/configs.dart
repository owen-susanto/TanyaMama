import 'package:flutter/material.dart';

class Configs {
  static String appName = "PAKKJ";

  static String httpLink = "https://api.pakkj.app";
  static String chatLink = "https://chat.pakkj.app";

  //Colors for theme
  static const primaryColor = Color.fromRGBO(36, 35, 94, 1);
  static const secondaryColor = Color.fromRGBO(244, 135, 32, 1);
  static const tertiaryColor = Color.fromRGBO(87, 80, 145, 1);
  static const quaternaryColor = Color.fromRGBO(0, 0, 47, 1);
  static const pentiaryColor = Color.fromRGBO(181, 84, 0, 1);
  static const backgroundColor = Color.fromRGBO(35, 65, 93, 1);
  static const statusBarColor = Color.fromRGBO(27, 26, 94, 1);
  static const stickyNotesColor = Color.fromRGBO(254, 255, 156, 1);
  static const placeHolderColor = Color.fromRGBO(205, 205, 205, 1);

  //Wheel Color
  static const color1 = Color.fromRGBO(164, 31, 142, 1); // red-purple
  static const color2 = Color.fromRGBO(88, 48, 146, 1); // purple
  static const color3 = Color.fromRGBO(37, 68, 156, 1); // purple-blue
  static const color4 = Color.fromRGBO(4, 101, 178, 1); // blue
  static const color5 = Color.fromRGBO(5, 169, 178, 1); // blue-green
  static const color6 = Color.fromRGBO(0, 166, 94, 1); // green
  static const color7 = Color.fromRGBO(111, 191, 70, 1); // yellow-green
  static const color8 = Color.fromRGBO(255, 241, 0, 1); // yellow
  static const color9 = Color.fromRGBO(248, 162, 39, 1); // orange-yellow
  static const color10 = Color.fromRGBO(246, 131, 34, 1); // orange
  static const color11 = Color.fromRGBO(241, 61, 64, 1); // red-orange
  static const color12 = Color.fromRGBO(238, 28, 37, 1); // red

  static const moneyColor = Color.fromRGBO(133, 187, 101, 1);
  static const dangerColor = Color.fromRGBO(217, 83, 79, 1);
  static const highlighterColor = Color.fromRGBO(254, 255, 126, 1);

  static const Color linkColor = Color(0XFF0000EE);

  static const double appBarTitleFontSize = 18.0;
  static const double screenPadding = 20.0;

  static const EdgeInsets screenEdgeInsets = EdgeInsets.symmetric(
    vertical: Configs.screenPadding / 1.5,
    horizontal: Configs.screenPadding,
  );

  static const EdgeInsets topLeftRightEdgeInsets = EdgeInsets.only(
    left: Configs.screenPadding,
    right: Configs.screenPadding,
    top: Configs.screenPadding / 1.5,
  );

  static RoundedRectangleBorder roundedRectangleBorder() {
    return const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12.5)),
    );
  }

  static RoundedRectangleBorder litteRoundedRectangleBorder() {
    return const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    );
  }

  static double listViewWidth(BuildContext context) {
    return (MediaQuery.of(context).size.width - (Configs.screenPadding * 2));
  }

  static Color colorByNumber(int number) {
    int realNumber = number % 12;
    switch (realNumber) {
      case 1:
        return color1;
      case 2:
        return color2;
      case 3:
        return color3;
      case 4:
        return color4;
      case 5:
        return color5;
      case 6:
        return color6;
      case 7:
        return color7;
      case 8:
        return color8;
      case 9:
        return color9;
      case 10:
        return color10;
      case 11:
        return color11;
      case 0:
        return color12;
      default:
        return color1;
    }
  }
}
