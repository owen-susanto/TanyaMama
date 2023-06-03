import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tanya_mama/basics/widgets/core_stateless_widget.dart';
import 'package:flutter_tanya_mama/configs/configs.dart';
import 'package:flutter_tanya_mama/widgets/custom/custom_text.dart';
import 'package:flutter_tanya_mama/widgets/input_title_with_info.dart';

class NormalFormField extends CoreStatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final TextInputType? keyboardType;
  final String? hintText;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final bool? readOnly;
  final bool? enabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final InputDecoration? decoration;
  final TextEditingController? controller;
  final double? withDivider;
  final String labelText;
  final String? informationText;

  final String? text;

  NormalFormField({
    required this.labelText,
    this.hintText,
    this.text,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
    this.keyboardType,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.textCapitalization,
    this.textInputAction,
    this.validator,
    this.focusNode,
    this.readOnly,
    this.enabled,
    this.prefixIcon,
    this.suffixIcon,
    this.inputFormatters,
    this.decoration,
    this.controller,
    this.withDivider = 1,
    this.informationText,
    super.key,
  }) {
    _textEditingController.text = text ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (informationText != null && informationText!.isNotEmpty)
            ? InputTitleWithInfo(
                title: labelText,
                description: informationText!,
              )
            : CustomText(
                labelText,
                fontSize: 15 * fontRatio,
                fontWeight: FontWeight.bold,
              ),
        SizedBox(
          width: MediaQuery.of(context).size.width / withDivider!,
          child: TextFormField(
            enabled: enabled ?? true,
            readOnly: readOnly ?? false,
            textInputAction: textInputAction,
            onChanged: onChanged,
            onFieldSubmitted: onFieldSubmitted,
            onTap: onTap,
            textCapitalization: textCapitalization ?? TextCapitalization.none,
            focusNode: focusNode,
            validator: validator,
            controller: controller ?? _textEditingController,
            cursorWidth: 2.5,
            cursorRadius: const Radius.circular(10),
            cursorColor: Configs.primaryColor,
            style: TextStyle(fontSize: 16 * fontRatio),
            keyboardType: keyboardType ?? TextInputType.text,
            decoration: decoration ??
                InputDecoration(
                  hintText: hintText ?? "",
                  prefixIcon: prefixIcon,
                  suffixIcon: suffixIcon,
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
            minLines: minLines,
            maxLines: maxLines,
            maxLength: maxLength,
            inputFormatters: inputFormatters ?? const [],
          ),
        ),
      ],
    );
  }
}
