import 'package:flutter_tanya_mama/basics/route_configurations/base_route_configuration.dart';

import 'package:flutter_tanya_mama/constants/page_name.dart';
import 'package:flutter_tanya_mama/functions/double_back_function.dart';
import 'introduction_screen.dart';

class IntroductionScreenRouteConfiguration extends BaseRouteConfiguration {
  IntroductionScreenRouteConfiguration()
      : super(
          PageName.Introduction,
          builder: (context) =>
              DoubleBackFunction.use(const IntroductionScreen()),
        );
}
