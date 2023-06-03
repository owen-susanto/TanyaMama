import 'package:flutter/material.dart';
import 'package:flutter_tanya_mama/basics/widgets/core_stateless_widget.dart';
import 'package:flutter_tanya_mama/configs/configs.dart';
import 'package:flutter_tanya_mama/functions/token_version.dart';
import 'package:flutter_tanya_mama/widgets/builder/future_use.dart';
import 'package:flutter_tanya_mama/widgets/link_text_span.dart';

class Agreement extends CoreStatelessWidget {
  const Agreement({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(
                color: Colors.black,
                fontFamily: "DINPro",
                fontSize: 14 * fontRatio,
              ),
              children: [
                const TextSpan(text: "Dengan masuk, kamu menyetujui "),
                LinkTextSpan(
                  text: "Ketentuan Layanan",
                  url: "https://pakkj.app/terms.html",
                  style: const TextStyle(
                    color: Configs.linkColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const TextSpan(text: " dan "),
                LinkTextSpan(
                  text: "Kebijakan Privasi",
                  url: "https://pakkj.app/privacy.html",
                  style: const TextStyle(
                    color: Configs.linkColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const TextSpan(text: " aplikasi."),
              ],
            ),
          ),
        ),
        const SizedBox(height: 5),
        FutureUse<String>(
          future: TokenVersion.getVersionString(),
          builder: (context, snapshot) => Text(snapshot.data ?? ""),
        ),
      ],
    );
  }
}
