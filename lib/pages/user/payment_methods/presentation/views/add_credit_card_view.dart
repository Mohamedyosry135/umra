import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/lang/user_translation_service.dart';
import 'package:umra/pages/user/payment/presentation/views/widgtes/visa_card_widget.dart';
import 'package:umra/pages/user/payment_methods/presentation/controllers/add_credit_card_controller.dart';
import 'package:umra/pages/user/payment_methods/presentation/controllers/payment_methods_controller.dart';
import 'package:umra/pages/user/payment_methods/presentation/views/widgtes/bank_account_card.dart';
import 'package:umra/pages/user/payment_methods/presentation/views/widgtes/select_payment_method.dart';
import 'package:umra/pages/user/umrah_add_request/presentation/view/widgets/input_formatter.dart';
import 'package:umra/widgets/custom_button.dart';
import 'package:umra/widgets/custom_text.dart';
import 'package:umra/widgets/custom_text_field_container.dart';
import 'package:umra/widgets/custom_text_form_field.dart';

import '../../../../../widgets/custom_bottom_sheet.dart';

class AddCreditCardView extends GetView<AddCreditCardController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(ColorCode.primary),
        title: CustomText(
          text: UserLang.creditDebitCard.tr(),
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
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        VisaCardWidget(),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomText(
                          text: UserLang.cardNumber.tr(),
                          textAlign: TextAlign.start,
                          textStyle:
                          TextStyles.textMedium18.copyWith(fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Color(ColorCode.brownishGrey)),
                        ),
                        CustomTextFieldContainer(

                            CustomTextFormField(
                              verticalPadding: 25,

                              hint: UserLang.cardNumber.tr(),
                              onSave: (String? val) {
                                // controller.email = val!;
                              },
                              maxLength: 16,
                              inputType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(16),
                                CardNumberInputFormatter()
                              ],

                            )
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        CustomText(
                          text: UserLang.nameCard.tr(),
                          textAlign: TextAlign.start,
                          textStyle:
                          TextStyles.textMedium18.copyWith(fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Color(ColorCode.brownishGrey)),
                        ),
                        CustomTextFieldContainer(

                            CustomTextFormField(
                              verticalPadding: 25,

                              hint: UserLang.nameCard.tr(),
                              onSave: (String? val) {
                                // controller.email = val!;
                              },
                              inputType: TextInputType.text,

                            )
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        CustomText(
                          text: UserLang.expiryDate.tr(),
                          textAlign: TextAlign.start,
                          textStyle:
                          TextStyles.textMedium18.copyWith(fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Color(ColorCode.brownishGrey)),
                        ),
                        CustomTextFieldContainer(

                            CustomTextFormField(
                              verticalPadding: 25,

                              hint:"MM/YY",
                              onSave: (String? val) {
                                // controller.email = val!;
                              },
                              inputType: TextInputType.datetime,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(4),
                                CardMonthInputFormatter(),
                              ],

                            )
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        CustomText(
                          text: "CVV",
                          textAlign: TextAlign.start,
                          textStyle:
                          TextStyles.textMedium18.copyWith(fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Color(ColorCode.brownishGrey)),
                        ),
                        CustomTextFieldContainer(

                            CustomTextFormField(
                              verticalPadding: 25,

                              hint: "XXX",
                              onSave: (String? val) {
                                // controller.email = val!;
                              },
                              maxLength: 3,
                              inputType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(3),
                              ],

                            )
                        ),
                        const SizedBox(
                          height: 10,
                        ),


                      ],
                    ),
                  )),
              CustomButton(
                onPressed: () {
                },
                width: 200,
                backGroundColor: const Color(ColorCode.primary),
                child: Text(
                  UserLang.add.tr(),
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
