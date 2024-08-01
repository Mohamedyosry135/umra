import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/storage.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/lang/translation_service.dart';
import 'package:umra/pages/common/boarding/presentation/controllers/boarding_controller.dart';
import 'package:umra/resources/common_assets.dart';
import 'package:umra/routes/common_routing/app_pages.dart';
import 'package:umra/services/auth_service.dart';
import 'package:umra/widgets/custom_button.dart';
import 'package:umra/widgets/custom_drop_down_widget.dart';
import 'package:umra/widgets/custom_text.dart';

class LanguageView extends GetView<BoardingController> {
  LanguageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx((state) => Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: const Color(ColorCode.white),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color(ColorCode.white),
            leading: SizedBox(),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.asset(AppAssets.logo()),
                    Image.asset(AppAssets.languageBg())
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: CommonLang.selectLanguage.tr(),
                          textStyle: TextStyles.textNormal18.copyWith(
                            color: const Color(ColorCode.greyscale500),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomDropDownWidget<String>(
                            value: controller.selectedLang,
                            items: controller.languages,
                            onChange: (String? val) {
                              controller.selectedLang = val.toString();
                              if (controller.selectedLang == "English") {
                                AuthService.to.selectLanguage("en");
                                AuthService.to.language = 'en';
                                Get.updateLocale(const Locale('en'));
                              } else {
                                AuthService.to.selectLanguage("ar");
                                AuthService.to.language = 'ar';
                                Get.updateLocale(const Locale('ar'));
                              }
                              controller.update();
                            }),
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                onPressed: () {
                                  Get.rootDelegate.toNamed(Routes.signupView);
                                },
                                backGroundColor: const Color(ColorCode.pale),
                                child: CustomText(
                                    text: CommonLang.signUp.tr(),
                                    textStyle: TextStyles.textButton),
                              ),
                            ),
                            const SizedBox(
                              width: 19,
                            ),
                            Expanded(
                              child: CustomButton(
                                onPressed: () {
                                  Get.rootDelegate.toNamed(Routes.LOGIN);
                                },
                                backGroundColor: const Color(ColorCode.primary),
                                child: CustomText(
                                    text: CommonLang.signIn.tr(),
                                    textStyle: TextStyles.textButton),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
