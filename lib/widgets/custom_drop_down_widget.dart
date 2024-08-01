import 'package:flutter/material.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/resources/common_assets.dart';
import 'package:umra/widgets/custom_text.dart';

class CustomDropDownWidget<T> extends StatelessWidget {
  final T value;
  final List<T> items;
  final Function(T?) onChange;
   TextStyle?textStyles;
   CustomDropDownWidget({Key? key,required this.value,required this.items,required this.onChange,this.textStyles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color:const Color(ColorCode.greyscale200))
      ),
      child: DropdownButton<T>(
        value: value,
        icon: Image.asset(AppAssets.dropDown()),
        elevation: 0,
        style: TextStyles.textBold22.copyWith(

            color: const Color(ColorCode.black),
        ),
        items: items.map((T items) {
          return DropdownMenuItem(
            value: items,
            child: CustomText(
              text: items.toString(),
              textStyle:  textStyles ??  TextStyles.textBold22.copyWith(
                color:  Color(ColorCode.black),
              ) ,
            ),
          );
        }).toList(),
        dropdownColor: const Color(ColorCode.white),
        menuMaxHeight: 300,
        borderRadius: BorderRadius.circular(12),
        isExpanded: true,
        underline: const SizedBox(),
        onChanged: (T? val){
          onChange(val);
        },
      ),
    );
  }
}
