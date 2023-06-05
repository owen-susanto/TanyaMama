import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_tanya_mama/configs/configs.dart';
import 'package:flutter_tanya_mama/firebase_options.dart';
import 'package:flutter_tanya_mama/functions/double_back_function.dart';
import 'package:flutter_tanya_mama/functions/token_version.dart';
// import 'package:flutter_tanya_mama/screens/home/home_screen.dart';
import 'package:flutter_tanya_mama/screens/introduction/introduction_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

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
    return StreamBuilder<User?>(
      stream: initAndGetToken(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var user = snapshot.data;

          if (user == null) {
            return DoubleBackFunction.use(const IntroductionScreen());
          } else {
            return Container();
            // return DoubleBackFunction.use(const HomeScreen());
          }
        } else {
          return DoubleBackFunction.use(const IntroductionScreen());
        }
      },
    );
  }

  static Stream<User?> initAndGetToken() {
    TokenVersion.init();
    var instance = FirebaseAuth.instanceFor(
        app: Firebase.app(), persistence: Persistence.LOCAL);
    return instance.authStateChanges();
  }
}
