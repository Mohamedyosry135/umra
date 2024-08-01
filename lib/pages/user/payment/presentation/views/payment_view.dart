import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/lang/user_translation_service.dart';
import 'package:umra/pages/user/payment/presentation/controllers/payment_controller.dart';
import 'package:umra/pages/user/payment/presentation/views/widgtes/visa_card_widget.dart';
import 'package:umra/routes/user_routing/user_app_pages.dart';
import 'package:umra/widgets/custom_button.dart';
import 'package:umra/widgets/custom_text.dart';

class PaymentView extends GetView<PaymentController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(ColorCode.white),
        iconTheme: IconThemeData(
        color: Color(ColorCode.black), //change your color here
      ),
        title: CustomText(
          text: UserLang.paymentTitle.tr(),
          textStyle: TextStyles.textBold18.copyWith(
              color: Color(ColorCode.darkBlue), fontWeight: FontWeight.w700),
        ),
        elevation: .5,
        centerTitle: true,
      ),
      backgroundColor: const Color(ColorCode.white),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                          text: UserLang.paymentMethod.tr(),
                          textStyle: TextStyles.textBold18.copyWith(
                              color: Color(ColorCode.darkBlue),
                              fontWeight: FontWeight.w700,
                              fontSize: 16)),
                      InkWell(
                        onTap: (){
                          Get.rootDelegate.toNamed(UserRoutes.PAYMENT_METHODS);
                        },
                        child: CustomText(
                            text: UserLang.change.tr(),
                            textStyle: TextStyles.textBold18.copyWith(
                                color: Color(ColorCode.primary),
                                fontWeight: FontWeight.w700,
                                fontSize: 14)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  VisaCardWidget()
                ],
              )),
              CustomButton(
                onPressed: () {
                  Get.rootDelegate.toNamed(UserRoutes.TRANACTIONS);
                },
                backGroundColor: const Color(ColorCode.primary),
                child: Text(
                  UserLang.placeOrder.tr(),
                  style: TextStyles.textMedium18
                      .copyWith(color: const Color(ColorCode.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
