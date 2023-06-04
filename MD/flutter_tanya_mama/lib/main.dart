import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_tanya_mama/configs/configs.dart';
import 'package:flutter_tanya_mama/firebase_options.dart';
import 'package:flutter_tanya_mama/functions/double_back_function.dart';
import 'package:flutter_tanya_mama/functions/token_version.dart';
// import 'package:flutter_tanya_mama/screens/home/home_screen.dart';
import 'package:flutter_tanya_mama/screens/introduction/introduction_screen.dart';
import 'package:flutter_tanya_mama/widgets/builder/future_use.dart';
import 'package:page_transition/page_transition.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

    runApp(const MyApp());
  }, (error, stack) => {});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Configs.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "DINPro",
        useMaterial3: true,
        primaryColor: Configs.primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AnimatedSplashScreen(
        splash: "assets/pakkj.png",
        splashIconSize: 225,
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
        backgroundColor: Colors.white,
        duration: 1500,
        nextScreen: getHomeScreen(context),
        curve: Curves.easeInOutCirc,
      ),
    );
  }

  static Widget getHomeScreen(BuildContext context) {
    return FutureUse<User?>(
      future: initAndGetToken(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // if (snapshot.data?.isEmpty ?? true) {
          return DoubleBackFunction.use(const IntroductionScreen());
          // }
          // else {
          //   return DoubleBackFunction.use(const HomeScreen());
          // }
        } else {
          return DoubleBackFunction.use(const IntroductionScreen());
        }
      },
    );
  }

  static Future<String> initAndGetToken() async {
    await TokenVersion.init();
    return FirebaseAuth.instance.
  }
}
