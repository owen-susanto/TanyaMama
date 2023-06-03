import 'package:flutter/material.dart';
import 'package:flutter_tanya_mama/configs/configs.dart';

class PlaceHolder extends StatefulWidget {
  final double ratioX;
  final double ratioY;
  final EdgeInsetsGeometry? padding;

  const PlaceHolder({
    super.key,
    this.ratioX = 16,
    this.ratioY = 9,
    this.padding,
  });

  @override
  State<PlaceHolder> createState() => _PlaceHolderState();
}

class _PlaceHolderState extends State<PlaceHolder> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widget.ratioX / widget.ratioY,
      child: Container(
        color: Configs.placeHolderColor,
        child: Padding(
          padding: widget.padding ?? const EdgeInsets.all(8.0),
          child: Center(
            child: Image.asset('assets/empty.png'),
          ),
        ),
      ),
    );
  }
}
