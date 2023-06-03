import 'package:flutter/material.dart';
import 'package:flutter_tanya_mama/basics/widgets/core_stateful_widget.dart';
import 'package:flutter_tanya_mama/widgets/custom/custom_text.dart';
import 'package:flutter_tanya_mama/widgets/normal_form_field.dart';

class CustomMultipleInput extends CoreStatefulWidget {
  final String label;
  final List<String>? values;

  const CustomMultipleInput({required this.label, this.values, Key? key})
      : super(key: key);

  @override
  CoreStatefulWidgetState<CustomMultipleInput> createState() =>
      _CustomMultipleInputState();
}

class _CustomMultipleInputState
    extends CoreStatefulWidgetState<CustomMultipleInput> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Expanded(
            child: CustomText(
              widget.label,
              fontSize: 15 * fontRatio,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            onPressed: () {
              widget.values!.add("");
              setState(() {});
            },
            icon: const Icon(Icons.add, color: Colors.black, size: 20),
          ),
        ],
      ),
      ListView.separated(
        itemBuilder: (context, i) => _buildInput(widget.values![i], i),
        separatorBuilder: (context, i) => const SizedBox(height: 10),
        itemCount: widget.values!.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
      ),
    ]);
  }

  Widget _buildInput(String value, int index) {
    return Row(
      children: [
        Expanded(
          child: NormalFormField(
            text: value,
            labelText: "",
            keyboardType: TextInputType.url,
            onChanged: (val) => widget.values![index] = val,
            onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
            textInputAction: TextInputAction.done,
          ),
        ),
        IconButton(
          onPressed: () {
            widget.values!.removeAt(index);
            setState(() {});
          },
          icon: const Icon(Icons.remove, color: Colors.black, size: 20),
        ),
      ],
    );
  }
}
