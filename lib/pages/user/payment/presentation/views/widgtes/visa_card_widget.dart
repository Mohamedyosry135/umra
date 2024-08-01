import 'package:flutter/cupertino.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/lang/user_translation_service.dart';
import 'package:umra/resources/common_assets.dart';
import 'package:umra/widgets/custom_text.dart';

class VisaCardWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return  Container(
      padding: EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: ColorCode.gradientColor,),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(AppAssets.sim()),
              Image.asset(AppAssets.visa())
            ],
          ),
          const SizedBox(height: 16,),
          CustomText(text: "**** **** **** 1245", textStyle: TextStyles.textMedium20.copyWith(
            color: Color(ColorCode.white),

          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(text: UserLang.cardHolder.tr(), textStyle: TextStyles.textMedium18.copyWith(
                  color: Color(ColorCode.white),
                  fontSize: 12
              )),
              CustomText(text: UserLang.expires.tr(), textStyle: TextStyles.textMedium18.copyWith(
                  color: Color(ColorCode.white),
                  fontSize: 12
              )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(text: "Marion Angela", textStyle: TextStyles.textMedium18.copyWith(
                  color: Color(ColorCode.white),
                  fontSize: 12
              )),
              CustomText(text: "11/10", textStyle: TextStyles.textMedium20.copyWith(
                  color: Color(ColorCode.white),
                  fontWeight: FontWeight.w700,
                  fontSize: 12
              )),
            ],
          ),
        ],
      ),

    );
  }

}