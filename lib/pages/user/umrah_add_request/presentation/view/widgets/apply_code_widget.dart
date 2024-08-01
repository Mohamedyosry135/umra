import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/pages/user/umrah_add_request/presentation/controllers/umrah_add_request_controller.dart';
import 'package:umra/widgets/custom_button.dart';
import 'package:umra/widgets/custom_text.dart';
import 'package:umra/widgets/custom_text_form_field.dart';

import '../../../../../../lang/user_translation_service.dart';

class ApplyCoupon extends GetView<UmrahAddRequestController> {
  const ApplyCoupon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(ColorCode.whitelight), width: 1),
      ),
      child: Row(
        children: [
          Expanded(
              child: CustomTextFormField(
            hint: 'dfjgdfgdhfgkjdfghbjdsgjdsfgbjkdfgd',
            onSave: (String? val) {},
            inputType: TextInputType.text,
            controller: controller.couponController,
            decoration:  InputDecoration(
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintStyle: TextStyles.textNormal18.copyWith(
                  color: const Color(ColorCode.black).withOpacity(.5),
                  fontSize: 12,
                ),
                hintText: 'q123123'),
            verticalPadding: 0,
          )),
          const SizedBox(
            width: 4,
          ),
          Obx(
            () => controller.promoCodeValid.value == false
                ? CustomButton(
                    onPressed: () {
                      controller
                          .checkPromoCode(controller.couponController.text);
                    },
                    backGroundColor: const Color(ColorCode.pale),
                    width: 100,

                    child: controller.promoCodeLoading.value == false
                        ? CustomText(
                            text: UserLang.apply.tr(),
                            textStyle: TextStyles.textMedium18.copyWith(
                                fontWeight: FontWeight.w700,
                                color: const Color(ColorCode.onCardColor)),
                          )
                        : const Center(
                            child: SpinKitCircle(
                              color: Color(ColorCode.orangeFaded),
                            ),
                          ),
                  )
                : CustomButton(
                    onPressed: () {},
                    backGroundColor: const Color(ColorCode.pale),
                    width: 100,
                    child: CustomText(
                      text: UserLang.apply.tr(),
                      textStyle: TextStyles.textMedium18.copyWith(
                          fontWeight: FontWeight.w700,
                          color: const Color(ColorCode.green)),
                    )),
          )
        ],
      ),
    );
  }
}
