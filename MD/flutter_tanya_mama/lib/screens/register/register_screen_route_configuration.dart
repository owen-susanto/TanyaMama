import 'package:flutter_tanya_mama/basics/route_configurations/base_route_configuration.dart';

import 'package:flutter_tanya_mama/constants/page_name.dart';
import 'register_screen.dart';

class RegisterScreenRouteConfiguration extends BaseRouteConfiguration {
  RegisterScreenRouteConfiguration()
      : super(PageName.Register, builder: (context) => const RegisterScreen());
}
