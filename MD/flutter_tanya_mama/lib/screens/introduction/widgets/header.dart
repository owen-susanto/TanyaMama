import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_tanya_mama/configs/configs.dart';
import 'package:flutter_tanya_mama/widgets/custom/custom_text.dart';

class Header extends StatefulWidget {
  final bool flip;
  final bool withAppBar;
  final bool withBackButton;
  final String title;
  final Gradient? gradient;
  final List<Widget>? actions;
  final Widget? leading;
  final CustomClipper<Path>? clipper;

  const Header({
    super.key,
    this.flip = false,
    this.withAppBar = false,
    this.withBackButton = false,
    this.title = "",
    this.gradient,
    this.actions,
    this.leading,
    this.clipper,
  });

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: widget.clipper ?? WaveClipperOne(flip: widget.flip),
      child: Stack(
        children: <Widget>[
          Container(
            height: 125,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: widget.gradient ??
                  LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      if (widget.flip) Configs.pentiaryColor,
                      Configs.secondaryColor,
                      if (!widget.flip) Configs.pentiaryColor,
                    ],
                  ),
            ),
          ),
          if (widget.withAppBar)
            Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              child: AppBar(
                title: CustomText(
                  widget.title,
                  fontSize: 20,
                  color: Colors.white,
                ),
                centerTitle: true,
                leading: !widget.withBackButton
                    ? widget.leading
                    : const BackButton(),
                backgroundColor: Colors.transparent,
                elevation: 0,
                scrolledUnderElevation: 0,
                actions: widget.actions,
              ),
            ),
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
