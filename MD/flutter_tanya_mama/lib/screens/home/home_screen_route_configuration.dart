import 'package:flutter_tanya_mama/basics/route_configurations/base_route_configuration.dart';

import 'package:flutter_tanya_mama/constants/page_name.dart';
import 'home_screen.dart';

class HomeScreenRouteConfiguration extends BaseRouteConfiguration {
  HomeScreenRouteConfiguration()
      : super(PageName.Home, builder: (context) => const HomeScreen());
}
