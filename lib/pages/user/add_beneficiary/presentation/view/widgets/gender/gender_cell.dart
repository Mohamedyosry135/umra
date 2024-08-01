import 'package:flutter/material.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';

class GenderCell extends StatelessWidget {
  final String genderName;
  final bool isSelected;
  const GenderCell({Key? key,required this.genderName,required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: const Color(ColorCode.white),
        border: Border.all(color:isSelected ? const Color(ColorCode.orangeFaded) :  const Color(ColorCode.gray)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          genderName,
          style: TextStyles.textMedium18.copyWith(
            fontSize: 16,
            color:isSelected ? const Color(ColorCode.orangeFaded) :  const Color(ColorCode.textLight)
          ),
        ),
      ),
    );
  }
}
