import 'package:flutter/material.dart';
import 'package:flutter_tanya_mama/constants/page_name.dart';

abstract class IRouteConfiguration {
  Future<Widget> getScreen(BuildContext context);
  PageName? pageName;
}
