import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/lang/translation_service.dart';
import 'package:umra/pages/common/boarding/presentation/controllers/boarding_controller.dart';
import 'package:umra/resources/common_assets.dart';
import 'package:umra/routes/common_routing/app_pages.dart';
import 'package:umra/widgets/custom_button.dart';
import 'package:umra/widgets/custom_text.dart';

class BoardingView extends GetView<BoardingController> {
  const BoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx((state) => SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: const Color(ColorCode.white),
            appBar: AppBar(
              elevation: 0,
              backgroundColor: const Color(ColorCode.white),
              leading: Obx(() => controller.currentIndex.value == 0
                  ? const SizedBox()
                  : InkWell(
                      onTap: () {
                        controller.pageController.previousPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.linear);
                      },
                      child: Image.asset(AppAssets.backArrow()),
                    )),
            ),
            body: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (value) {
                        controller.currentIndex.value = value;
                      },
                      controller: controller.pageController,
                      itemCount: controller.imageSilders.value.length,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                                image: AssetImage(controller
                                    .imageSilders.value[index].image!)),
                            const SizedBox(height: 100),
                            CustomText(
                              text: controller.imageSilders.value[index].title!,
                              textStyle: TextStyles.textBold25.copyWith(
                                  fontSize: 29,
                                  color: const Color(ColorCode.orangeFaded)
                              ),
                            ),
                            const SizedBox(height: 12),
                            CustomText(
                              text: controller.imageSilders.value[index].description!,
                              textStyle: TextStyles.textMedium18.copyWith(
                                color: const Color(ColorCode.greyscale500),
                              ),
                            ),
                            const SizedBox(height: 25),
                          ],
                        );
                      },
                    ),
                  ),
                  Obx((){
                    return CustomButton(
                      onPressed: () {
                        if (controller.currentIndex.value == 2) {
                          Get.rootDelegate.offNamed(Routes.LANGUAGE);
                        } else {
                          controller.pageController.nextPage(duration: const Duration(milliseconds: 500),curve: Curves.linear);
                        }
                      },
                      backGroundColor: const Color(ColorCode.primary),
                      child: CustomText(
                          text: controller.currentIndex.value == 2
                              ? CommonLang.start.tr()
                              : CommonLang.next.tr(),
                          textStyle: TextStyles.textButton
                      ),
                    );
                  })
                ],
              ),
            ),
          ),
        ));
  }
}
