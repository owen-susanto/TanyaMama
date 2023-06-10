import 'package:flutter/material.dart';
import 'package:flutter_tanya_mama/basics/widgets/core_stateless_widget.dart';
import 'package:flutter_tanya_mama/configs/configs.dart';

import 'custom/custom_text.dart';

class TitleButton extends CoreStatelessWidget {
  final String title;
  final String? subtitle;
  final IconData iconData;
  final void Function()? onTap;
  final Color? color;

  const TitleButton({
    required this.title,
    this.subtitle,
    required this.iconData,
    this.onTap,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 10,
          ),
          leading: Icon(
            iconData,
            color: color ?? Configs.primaryColor,
            size: 24 * fontRatio,
          ),
          title: CustomText(
            title,
            fontSize: 20 * fontRatio,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: subtitle == null
              ? null
              : CustomText(
                  subtitle!,
                  fontSize: 14 * fontRatio,
                ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: color ?? Configs.secondaryColor,
            size: 24 * fontRatio,
          ),
          onTap: onTap,
        ),
        const Divider(color: Colors.grey, height: 1),
      ],
    );
  }
}
