import 'package:flutter/material.dart';
import 'package:flutter_tanya_mama/functions/token_version.dart';

abstract class CoreStatelessWidget extends StatelessWidget {
  double get fontRatio => TokenVersion.getFontRatio();

  const CoreStatelessWidget({Key? key}) : super(key: key);
}
