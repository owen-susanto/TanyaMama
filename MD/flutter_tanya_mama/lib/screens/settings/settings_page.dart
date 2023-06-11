import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tanya_mama/basics/widgets/core_stateful_widget.dart';
import 'package:flutter_tanya_mama/constants/page_name.dart';
import 'package:flutter_tanya_mama/functions/routes.dart';
import 'package:flutter_tanya_mama/widgets/custom/custom_text.dart';
import 'package:flutter_tanya_mama/widgets/title_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SettingsPage extends CoreStatefulWidget {
  const SettingsPage({super.key});

  @override
  CoreStatefulWidgetState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends CoreStatefulWidgetState<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleButton(
            iconData: FontAwesomeIcons.clipboardList,
            title: "Sejarah Chat",
            subtitle: "Lihat pertanyaanmu sebelumnya disini",
            onTap: () async => await Routes.push(context, PageName.ChatLog),
          ),
          TitleButton(
            iconData: FontAwesomeIcons.arrowRightFromBracket,
            title: "Keluar",
            subtitle: "Yakin mau keluar? Nanti harus login lagi",
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Routes.pushAndRemoveUntil(context, PageName.Introduction);
            },
          ),
        ],
      ),
    );
  }
}
