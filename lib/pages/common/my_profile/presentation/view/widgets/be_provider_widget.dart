import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/lang/translation_service.dart';
import 'package:umra/lang/user_translation_service.dart';
import 'package:umra/resources/common_assets.dart';
import 'package:umra/routes/common_routing/app_pages.dart';
import 'package:umra/routes/user_routing/user_app_pages.dart';
import 'package:umra/widgets/custom_button.dart';
import 'package:umra/widgets/custom_text.dart';

class BeProviderWidget extends StatelessWidget {
  const BeProviderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
      decoration: BoxDecoration(
        color: const Color(ColorCode.cardBackgroundColor),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          PositionedDirectional(
            end: 0.0,
            top: 0.0,
            child: Image.asset(
              AppAssets.decoration(),
              width: 190,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomText(
                        text: UserLang.wantBeProvider.tr(),
                        textStyle: TextStyles.textNormal18.copyWith(
                          color: const Color(ColorCode.onCardColor),
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    CustomButton(
                      onPressed: () {
                        Get.rootDelegate.toNamed(Routes.applyagentView);
                      },
                      backGroundColor: const Color(ColorCode.primary),
                      width: 120,
                      child:  CustomText(
                          text: CommonLang.request.tr(),
                          textStyle: TextStyles.textNormal18.copyWith(
                            color: const Color(ColorCode.white)
                          )
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
