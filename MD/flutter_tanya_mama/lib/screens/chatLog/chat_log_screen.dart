import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tanya_mama/basics/screens/base_screen_with_app_bar.dart';
import 'package:flutter_tanya_mama/constants/page_name.dart';
import 'package:flutter_tanya_mama/screens/chatLog/chat_log_page.dart';
import 'package:flutter_tanya_mama/widgets/custom/custom_text.dart';

class ChatLogScreen extends BaseScreenWithAppBar {
  const ChatLogScreen({super.key}) : super(PageName.ChatLog);
  @override
  // TODO: implement padding
  EdgeInsets get padding => EdgeInsets.zero;
  @override
  // TODO: implement scrollable
  bool get scrollable => false;
  @override
  Widget content(BuildContext context) {
    return const ChatLogPage();
  }

  @override
  AppBar appBar(BuildContext context) {
    return AppBar(
      title: const CustomText("Sejarah Chat", fontSize: 20),
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
