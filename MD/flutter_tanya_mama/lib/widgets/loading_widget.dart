import 'package:flutter/material.dart';
import 'package:flutter_tanya_mama/configs/configs.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  final double? containerHeight;
  final bool withContainer;

  const LoadingWidget({
    this.containerHeight,
    this.withContainer = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return withContainer
        ? SizedBox(
            height: containerHeight,
            child: content(),
          )
        : content();
  }

  Widget content() {
    return const Center(
      child: SpinKitFadingCircle(
        color: Configs.tertiaryColor,
        size: 100.0,
      ),
    );
  }
}
