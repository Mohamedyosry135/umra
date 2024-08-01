import 'package:flutter/material.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/widgets/custom_text.dart';

class BankAccount extends StatelessWidget {
  const BankAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text:"Arab Bank afghanistan",
            textStyle: TextStyles.textMedium18.copyWith(
                fontSize: 16,
                color: const Color(ColorCode.greyscale500)
            ),
          ),
          CustomText(
            text:"USD account ending in 6410 ",
            textStyle: TextStyles.textMedium18.copyWith(
                fontSize: 16,
                color: const Color(ColorCode.greyscale500)
            ),

          ),
        ]
    );
  }
}
