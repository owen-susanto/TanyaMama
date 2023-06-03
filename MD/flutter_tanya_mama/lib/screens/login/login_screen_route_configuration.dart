import 'package:flutter_tanya_mama/basics/route_configurations/base_route_configuration.dart';

import 'package:flutter_tanya_mama/constants/page_name.dart';
import 'login_screen.dart';

class LoginScreenRouteConfiguration extends BaseRouteConfiguration {
  LoginScreenRouteConfiguration()
      : super(PageName.Login, builder: (context) => const LoginScreen());
}
