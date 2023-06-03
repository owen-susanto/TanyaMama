import 'package:flutter/material.dart';
import 'package:flutter_tanya_mama/basics/widgets/core_stateful_widget.dart';
import 'package:flutter_tanya_mama/configs/configs.dart';

class CustomCheckBoxWithRichText extends CoreStatefulWidget {
  final void Function(bool) onChanged;
  final bool initialValue;
  final List<InlineSpan> listInlineSpan;

  const CustomCheckBoxWithRichText(this.listInlineSpan,
      {super.key, required this.onChanged, this.initialValue = false});

  @override
  CoreStatefulWidgetState<CustomCheckBoxWithRichText> createState() =>
      _CustomCheckBoxWithRichTextState();
}

class _CustomCheckBoxWithRichTextState
    extends CoreStatefulWidgetState<CustomCheckBoxWithRichText> {
  late bool value;

  @override
  void initState() {
    value = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        value = !value;
        widget.onChanged(value);
      },
      child: Row(
        children: <Widget>[
          Checkbox(
            activeColor: Configs.primaryColor,
            value: value,
            onChanged: (_) {
              value = !value;
              widget.onChanged(value);
            },
          ),
          Expanded(child: _getRichText()),
        ],
      ),
    );
  }

  Widget _getRichText() {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: Colors.black,
          fontFamily: "DINPro",
          fontSize: 14 * fontRatio,
        ),
        children: widget.listInlineSpan,
      ),
    );
  }
}
