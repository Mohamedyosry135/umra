import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/resources/common_assets.dart';
import 'package:umra/widgets/custom_text.dart';

class HomeControlCell extends StatelessWidget {
  final String image;
  final String value;
  final Function() onTap;
  const HomeControlCell({Key? key,required this.value,required this.onTap,required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 22),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: const Color(ColorCode.gray),width: 1.5)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: 35,
              width: 35,
            ),
            const SizedBox(height: 8,),
            CustomText(
              text: value,
              textStyle: TextStyles.textSmall.copyWith(
                fontSize: 15
              ),
            )
          ],
        ),
      ),
    );
  }
}
