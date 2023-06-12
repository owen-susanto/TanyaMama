import 'package:flutter/material.dart';

import 'package:flutter_tanya_mama/configs/configs.dart';
import 'package:flutter_tanya_mama/constants/page_name.dart';
import 'package:flutter_tanya_mama/functions/routes.dart';
import 'package:flutter_tanya_mama/screens/introduction/widgets/header.dart';
import 'package:flutter_tanya_mama/widgets/base_raised_button.dart';
import 'package:flutter_tanya_mama/widgets/custom/custom_text.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({super.key});

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;

    if (orientation == Orientation.portrait) {
      return SizedBox(
        height: screenSize.height,
        width: screenSize.width,
        child: _content(),
      );
    } else {
      return _content();
    }
  }

  Widget _content() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const Header(),
        Padding(
          padding: Configs.screenEdgeInsets,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Image.asset(
                  'assets/Mama_Melambai.png',
                  width: MediaQuery.of(context).size.width * 1,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 45),
              const CustomText(
                "Selamat Datang di Tanya Mama!",
                textAlign: TextAlign.left,
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 20),
              const CustomText(
                "Gabung sekarang, dapatkan bantuan dan kelola keuanganmu dengan optimal. Daftar di aplikasi kami, ubah hidup keuanganmu hari ini!",
                textAlign: TextAlign.left,
                fontSize: 15,
              ),
              const SizedBox(height: 25),
              Center(
                child: SizedBox(
                  height: 50,
                  child: BaseRaisedButton(
                    ratio: 1 / 1.25,
                    onPressed: () async {
                      Routes.pushReplacement(context, PageName.Login);
                    },
                    color: Configs.secondaryColor,
                    child: const Text(
                      "MASUK",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // const Agreement(),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ],
    );
  }
}
