import 'package:flutter/material.dart';
import 'package:flutter_tanya_mama/constants/page_name.dart';
import 'package:flutter_tanya_mama/interfaces/i_route_configuration.dart';

abstract class BaseRouteConfiguration implements IRouteConfiguration {
  final Function(BuildContext context)? builder;

  @override
  PageName? pageName;

  BaseRouteConfiguration(this.pageName, {this.builder});

  @override
  Future<Widget> getScreen(BuildContext context) {
    return Future.value(builder!(context));
  }
}
