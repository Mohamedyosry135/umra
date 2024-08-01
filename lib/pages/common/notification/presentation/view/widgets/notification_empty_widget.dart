import 'package:flutter/material.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/lang/translation_service.dart';
import 'package:umra/resources/common_assets.dart';
import 'package:umra/widgets/custom_button.dart';

class NotificationEmptyWidget extends StatelessWidget {
  const NotificationEmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppAssets.notificationEmpty(),
            width: 150,
            height: 150,
          ),
          const SizedBox(height: 25,),
          Text(
            CommonLang.emptyMsg.tr(),
            style: TextStyles.textBold25.copyWith(
                color: Color(ColorCode.black)
            ),
          ),
          const SizedBox(height: 10,),
          Text(
            CommonLang.notificationEmptyMsg.tr(),
            style: TextStyles.textMedium18.copyWith(
              color: Color(ColorCode.black).withOpacity(.5),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15,),
          Center(
            child: CustomButton(
                width: 200,
                height: 60,
                backGroundColor: const Color(ColorCode.primary),
                onPressed: (){},
                child: Text(
                  CommonLang.startShopping.tr(),
                  style: TextStyles.textSmall.copyWith(
                      color: const Color(ColorCode.white)
                  ),
                )
            ),
          )
        ],
      ),
    );
  }
}
