import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/lang/user_translation_service.dart';
import 'package:umra/routes/common_routing/app_pages.dart';
import 'package:umra/routes/user_routing/user_app_pages.dart';
import 'package:umra/widgets/custom_button.dart';
import 'package:umra/widgets/custom_home_widget.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomHomeWidget(
      onNotificationTap: (){
        Get.rootDelegate.toNamed(Routes.NOTIFICATION);
      },
      stackContainer:  PositionedDirectional(
        bottom: 15,
        end: 0.0,
        start: 0.0,
        child: Center(
          child: CustomButton(
            width: 180,
            height: 50,
            backGroundColor: const Color(ColorCode.primary),
            onPressed: (){
              Get.rootDelegate.toNamed(UserRoutes.UMRAH_LIST);
            },
            child: Text(
              UserLang.requestUmrah.tr(),
              style: TextStyles.textSmall.copyWith(
                color: const Color(ColorCode.white)
              ),
            )
          ),
        ),
      ),
    );
  }
}
