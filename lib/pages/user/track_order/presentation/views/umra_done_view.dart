import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/lang/user_translation_service.dart';
import 'package:umra/pages/user/track_order/presentation/controllers/track_order_controller.dart';
import 'package:umra/pages/user/track_order/presentation/views/track_order_view.dart';
import 'package:umra/resources/common_assets.dart';
import 'package:umra/routes/user_routing/user_app_pages.dart';
import 'package:umra/widgets/custom_button.dart';
import 'package:umra/widgets/custom_text.dart';

class UmraDoneView extends GetView<TrackOrderController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(ColorCode.white),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(ColorCode.white),
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Image.asset(AppAssets.close())),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Image.asset(AppAssets.umraDone())),
                  SizedBox(
                    height: 60,
                  ),
                  CustomText(
                      text: UserLang.umraDone.tr(),
                      textStyle: TextStyles.textBold25.copyWith(
                          fontSize: 24,
                          color: Color(ColorCode.darkBlue),
                          fontWeight: FontWeight.w700
                      )
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  CustomText(
                      text: UserLang.providerEndUmra.tr(),
                      textStyle: TextStyles.textNormal18.copyWith(
                        fontSize: 16,
                        color: Color(ColorCode.greyscale500),
                      )
                  ),

                ],
              )),
              CustomButton(
                onPressed: (){
               Get.rootDelegate.toNamed(UserRoutes.RATE_PROVIDER);
                },
                backGroundColor: const Color(ColorCode.primary),
                child: Text(
                  UserLang.rateUmra.tr(),
                  style: TextStyles.textMedium18.copyWith(color: const Color(ColorCode.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
