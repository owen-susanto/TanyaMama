import 'package:flutter_tanya_mama/basics/route_configurations/base_route_configuration.dart';

import 'package:flutter_tanya_mama/constants/page_name.dart';
import 'chat_log_screen.dart';

class ChatLogScreenRouteConfiguration extends BaseRouteConfiguration {
  ChatLogScreenRouteConfiguration()
      : super(PageName.ChatLog, builder: (context) => const ChatLogScreen());
}
