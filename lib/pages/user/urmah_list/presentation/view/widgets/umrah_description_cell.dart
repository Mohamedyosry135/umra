import 'package:flutter/material.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/lang/translation_service.dart';
import 'package:umra/widgets/custom_text.dart';

class UmrahDescriptionCell extends StatelessWidget {
  final String cellTitle;
  final String cellValue;
  const UmrahDescriptionCell(
      {Key? key, required this.cellTitle, required this.cellValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${cellTitle.replaceAll(":", "")}  :  ",
          style: TextStyles.textMedium18.copyWith(),
        ),
        Expanded(
          child: Text(
            cellValue,
            style: TextStyles.textMedium18.copyWith(),
          ),
        ),
      ],
    );
  }
}
