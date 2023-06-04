import 'package:flutter/material.dart';
import 'package:flutter_tanya_mama/basics/widgets/core_stateful_widget.dart';
import 'package:flutter_tanya_mama/widgets/custom/custom_text.dart';
import 'package:flutter_tanya_mama/widgets/input_title_with_info.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_tanya_mama/configs/configs.dart';

class PasswordNormalFormField extends CoreStatefulWidget {
  final TextEditingController _textEditingController = TextEditingController();
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final bool? readOnly;
  final bool? enabled;
  final String? hintText;
  final double? withDivider;
  final String labelText;
  final String? informationText;
  TextEditingController? controller = TextEditingController();

  final String? text;

  PasswordNormalFormField({
    required this.labelText,
    this.focusNode,
    this.textInputAction = TextInputAction.done,
    this.validator,
    this.onFieldSubmitted,
    this.onChanged,
    this.onTap,
    this.controller,
    this.readOnly,
    this.enabled,
    this.hintText = "ex: ******",
    this.text,
    this.withDivider = 1,
    this.informationText,
    super.key,
  }) {
    _textEditingController.text = text ?? "";
  }

  @override
  CoreStatefulWidgetState<PasswordNormalFormField> createState() =>
      _PasswordNormalFormField();
}

class _PasswordNormalFormField
    extends CoreStatefulWidgetState<PasswordNormalFormField> {
  late bool _obscure;

  @override
  void initState() {
    _obscure = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (widget.informationText != null && widget.informationText!.isNotEmpty)
            ? InputTitleWithInfo(
                title: widget.labelText,
                description: widget.informationText!,
              )
            : CustomText(
                widget.labelText,
                fontSize: 15 * fontRatio,
                fontWeight: FontWeight.bold,
              ),
        SizedBox(
          width: MediaQuery.of(context).size.width / widget.withDivider!,
          child: TextFormField(
            enabled: widget.enabled ?? true,
            readOnly: widget.readOnly ?? false,
            textInputAction: widget.textInputAction,
            onChanged: widget.onChanged,
            onFieldSubmitted: widget.onFieldSubmitted,
            onTap: widget.onTap,
            controller: widget.controller,
            focusNode: widget.focusNode,
            validator: widget.validator,
            cursorWidth: 2.5,
            cursorRadius: const Radius.circular(10),
            cursorColor: Configs.primaryColor,
            style: TextStyle(fontSize: 16 * fontRatio),
            obscureText: _obscure,
            decoration: InputDecoration(
              hintText: widget.hintText ?? "",
              suffixIcon: GestureDetector(
                onTap: () => setState(() {
                  _obscure = !_obscure;
                }),
                child: Icon(
                  _obscure ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
                  size: 24 * fontRatio,
                ),
              ),
              suffixIconColor: MaterialStateColor.resolveWith(
                (states) => states.contains(MaterialState.focused)
                    ? Configs.primaryColor
                    : Colors.grey,
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Configs.primaryColor,
                  width: 2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
