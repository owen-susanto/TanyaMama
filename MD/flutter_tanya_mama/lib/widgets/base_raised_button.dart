import 'package:flutter/material.dart';
import 'package:flutter_tanya_mama/configs/configs.dart';

class BaseRaisedButton extends StatelessWidget {
  final void Function() onPressed;
  final Widget? child;
  final bool disabled;
  final Color? color;
  final double ratio;
  final BorderSide? border;

  const BaseRaisedButton({
    super.key,
    required this.onPressed,
    this.child,
    this.disabled = false,
    this.color = Configs.primaryColor,
    this.ratio = 1 / 1.25,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width * ratio),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: border ?? BorderSide.none,
            ),
          ),
          backgroundColor:
              disabled ? null : MaterialStateProperty.all<Color>(color!),
          elevation: disabled ? null : MaterialStateProperty.all<double>(0),
        ),
        onPressed: disabled ? null : onPressed,
        child: child,
      ),
    );
  }
}
