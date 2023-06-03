import 'package:flutter/material.dart';
import 'package:flutter_tanya_mama/basics/widgets/core_stateful_widget.dart';
import 'package:flutter_tanya_mama/widgets/custom/custom_text.dart';
import 'package:flutter_tanya_mama/widgets/input_title_with_info.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomDropdown<T extends Enum> extends CoreStatefulWidget {
  final bool isExpanded;
  final String? hint;
  final T? selected;
  final void Function(T?) onChanged;
  final List<T?> list;
  final String labelText;
  final String? informationText;

  const CustomDropdown({
    super.key,
    this.isExpanded = true,
    this.hint,
    this.selected,
    required this.onChanged,
    required this.list,
    required this.labelText,
    this.informationText,
  });

  @override
  CoreStatefulWidgetState<CustomDropdown<T>> createState() =>
      _CustomDropdownState<T>();
}

class _CustomDropdownState<T extends Enum>
    extends CoreStatefulWidgetState<CustomDropdown<T>> {
  T? selected;

  @override
  void initState() {
    selected = widget.selected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
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
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[500]!),
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          ),
          child: DropdownButtonHideUnderline(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<T>(
                isExpanded: widget.isExpanded,
                hint: Text(widget.hint ?? ""),
                icon: const Icon(FontAwesomeIcons.caretDown),
                style: TextStyle(
                  fontSize: 16 * fontRatio,
                  color: Colors.black,
                  fontFamily: "DINPro",
                ),
                value: selected,
                onChanged: (val) {
                  widget.onChanged(val);
                  selected = val;
                  setState(() {});
                },
                items: widget.list
                    .map(
                      (value) => DropdownMenuItem<T>(
                        value: value,
                        child: Text(value!.name),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
