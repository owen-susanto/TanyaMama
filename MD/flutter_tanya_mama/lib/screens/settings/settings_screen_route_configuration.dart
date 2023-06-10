import 'package:flutter_tanya_mama/basics/route_configurations/base_route_configuration.dart';

import 'package:flutter_tanya_mama/constants/page_name.dart';
import 'settings_screen.dart';

class SettingsScreenRouteConfiguration extends BaseRouteConfiguration {
  SettingsScreenRouteConfiguration()
      : super(PageName.Settings, builder: (context) => const SettingsScreen());
}
