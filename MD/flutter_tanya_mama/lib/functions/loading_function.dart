import 'package:flutter/material.dart';
import 'package:flutter_tanya_mama/configs/configs.dart';
import 'package:flutter_tanya_mama/widgets/loading_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingFunction {
  static Widget loadingSquareCircle(BuildContext context) {
    return const SizedBox(
      height: double.infinity,
      child: LoadingWidget(),
    );
  }

  static Widget loadingInside(BuildContext context) {
    return const LoadingWidget(withContainer: false);
  }

  static Widget loadingInfinte() {
    return const SpinKitThreeBounce(color: Configs.secondaryColor);
  }

  static Future showLoadingDialog(BuildContext context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return const SpinKitSquareCircle(
          color: Configs.secondaryColor,
          size: 125.0,
        );
      },
    );
  }

  static void closeLoadingDialog(BuildContext context) {
    Navigator.of(context).pop();
  }
}
