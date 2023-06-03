import 'package:flutter/material.dart';
import 'package:flutter_tanya_mama/functions/token_version.dart';

abstract class CoreStatefulWidget extends StatefulWidget {
  double get fontRatio => TokenVersion.getFontRatio();

  const CoreStatefulWidget({Key? key}) : super(key: key);
}

abstract class CoreStatefulWidgetState<T extends CoreStatefulWidget>
    extends State<T> {
  double get fontRatio => widget.fontRatio;
}
