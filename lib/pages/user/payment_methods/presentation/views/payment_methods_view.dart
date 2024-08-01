import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/lang/user_translation_service.dart';
import 'package:umra/pages/user/payment/presentation/views/widgtes/visa_card_widget.dart';
import 'package:umra/pages/user/payment_methods/presentation/controllers/payment_methods_controller.dart';
import 'package:umra/pages/user/payment_methods/presentation/views/widgtes/bank_account_card.dart';
import 'package:umra/pages/user/payment_methods/presentation/views/widgtes/select_payment_method.dart';
import 'package:umra/widgets/custom_button.dart';
import 'package:umra/widgets/custom_text.dart';

import '../../../../../widgets/custom_bottom_sheet.dart';

class PaymentMethodsView extends GetView<PaymentMethodsController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(ColorCode.primary),
        title: CustomText(
          text: UserLang.paymentMethod.tr(),
          textStyle: TextStyles.textBold18.copyWith(
              color: Color(ColorCode.white), fontWeight: FontWeight.w700),
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
                  Obx(() => RadioListTile(
                        value: 0,
                        groupValue: controller.radioButtonSelect.value,
                        onChanged: (val) {
                          controller.changePaymentMethod(val);
                        },
                        activeColor: Color(ColorCode.primary),
                        title: CustomText(
                          text: UserLang.creditDebitCard.tr(),
                          textStyle: TextStyles.textMedium18.copyWith(
                              color: Color(ColorCode.darkBlue),
                              fontWeight: FontWeight.w700,
                              fontSize: 14),
                          textAlign: TextAlign.start,
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: VisaCardWidget()),
                  Obx(() => RadioListTile(
                        value: 1,
                        groupValue: controller.radioButtonSelect.value,
                        onChanged: (val) {
                          controller.changePaymentMethod(val);
                        },
                        activeColor: Color(ColorCode.primary),
                        title: CustomText(
                          text: UserLang.bankAccount.tr(),
                          textStyle: TextStyles.textMedium18.copyWith(
                              color: Color(ColorCode.darkBlue),
                              fontWeight: FontWeight.w700,
                              fontSize: 14),
                          textAlign: TextAlign.start,
                        ),
                      )),
                  const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: BankAccount()),
                ],
              )),
              CustomButton(
                onPressed: () {

                  customBottomSheet(
                      backgroundColor: ColorCode.white,
                      bottomSheetBody: SelectPaymentMethodWidget()
                  );

                },
                backGroundColor: const Color(ColorCode.primary),
                child: Text(
                  UserLang.newPayment.tr(),
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
