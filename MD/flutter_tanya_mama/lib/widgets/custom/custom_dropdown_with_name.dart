import 'package:flutter/material.dart';
import 'package:flutter_tanya_mama/basics/widgets/core_stateful_widget.dart';
import 'package:flutter_tanya_mama/interfaces/i_has_name.dart';
import 'package:flutter_tanya_mama/widgets/custom/custom_text.dart';
import 'package:flutter_tanya_mama/widgets/input_title_with_info.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomDropdownWithName<T extends IHasName> extends CoreStatefulWidget {
  final bool isExpanded;
  final String? hint;
  final T? selected;
  final void Function(T?) onChanged;
  final List<T?> list;
  final String labelText;
  final String? informationText;

  const CustomDropdownWithName({
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
  CoreStatefulWidgetState<CustomDropdownWithName<T>> createState() =>
      _CustomDropdownWithNameState<T>();
}

class _CustomDropdownWithNameState<T extends IHasName>
    extends CoreStatefulWidgetState<CustomDropdownWithName<T>> {
  T? selected;

  late int selectedIndex;

  late List<DropdownMenuItem<T>> item;

  @override
  void initState() {
    item = widget.list
        .map(
          (value) => DropdownMenuItem<T>(
            value: value,
            child: Text(value!.name),
          ),
        )
        .toList();
    selectedIndex = widget.list.indexWhere((element) {
      return element?.name == (widget.selected?.name ?? widget.list[0]?.name);
    });
    selected = widget.list[selectedIndex];

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
                  setState(() => selected = val);
                },
                items: item,
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
