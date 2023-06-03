import 'package:flutter/material.dart';
import 'package:flutter_tanya_mama/basics/widgets/core_stateless_widget.dart';
import 'package:flutter_tanya_mama/widgets/custom/custom_text.dart';
import 'package:info_popup/info_popup.dart';

class InputTitleWithInfo extends CoreStatelessWidget {
  final String title;
  final String description;

  const InputTitleWithInfo({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomText(
          title,
          fontSize: 15 * fontRatio,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(width: 7.5),
        InfoPopupWidget(
          contentTitle: description,
          arrowTheme: const InfoPopupArrowTheme(
            arrowDirection: ArrowDirection.down,
          ),
          contentTheme: InfoPopupContentTheme(
            infoTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 14.0 * fontRatio,
            ),
          ),
          child: Icon(Icons.info_rounded, size: 20 * fontRatio),
        ),
      ],
    );
  }
}
