import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';

class DoubleBackFunction {
  static Widget use(Widget child) {
    return DoubleBack(
      message: "Tekan sekali lagi untuk menutup..",
      child: child,
    );
  }
}
