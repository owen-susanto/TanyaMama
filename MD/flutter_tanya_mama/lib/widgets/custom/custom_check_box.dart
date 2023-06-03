import 'package:flutter/material.dart';
import 'package:flutter_tanya_mama/basics/widgets/core_stateful_widget.dart';
import 'package:flutter_tanya_mama/configs/configs.dart';

class CustomCheckBox extends CoreStatefulWidget {
  final void Function(bool) onChanged;
  final bool initialValue;
  final String text;
  final bool disabled;
  final bool withExpanded;

  const CustomCheckBox(
    this.text, {
    super.key,
    required this.onChanged,
    this.initialValue = false,
    this.disabled = false,
    this.withExpanded = true,
  });

  @override
  CoreStatefulWidgetState<CustomCheckBox> createState() =>
      _CustomCheckBoxState();
}

class _CustomCheckBoxState extends CoreStatefulWidgetState<CustomCheckBox> {
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
        if (!widget.disabled) {
          setState(() {
            value = !value;
          });
          widget.onChanged(value);
        }
      },
      child: Row(
        children: <Widget>[
          Checkbox(
            activeColor: Configs.primaryColor,
            value: value,
            onChanged: (_) {
              if (!widget.disabled) {
                setState(() {
                  value = !value;
                });
                widget.onChanged(value);
              }
            },
          ),
          widget.withExpanded ? Expanded(child: _getText()) : _getText(),
        ],
      ),
    );
  }

  Widget _getText() {
    return Text(widget.text, style: TextStyle(fontSize: 16 * fontRatio));
  }
}
