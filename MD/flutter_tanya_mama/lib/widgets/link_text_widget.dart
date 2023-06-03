import 'package:flutter/material.dart';
import 'package:flutter_tanya_mama/configs/configs.dart';

class LinkTextWidget extends StatelessWidget {
  final String linkText;
  final Widget target;

  const LinkTextWidget({
    required this.linkText,
    required this.target,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => target,
        ),
      ),
      child: Text(
        linkText,
        style: const TextStyle(
          decoration: TextDecoration.underline,
          fontWeight: FontWeight.bold,
          color: Configs.linkColor,
          fontSize: 16,
        ),
      ),
    );
  }
}

class RegisterPageMobile {}
