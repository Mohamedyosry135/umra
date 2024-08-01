import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:umra/consts/colors.dart';


import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/lang/user_translation_service.dart';
import 'package:umra/pages/user/payment_methods/presentation/controllers/bank_account_controller.dart';


import 'package:umra/pages/user/payment_methods/presentation/controllers/payment_methods_controller.dart';
import 'package:umra/pages/user/payment_methods/presentation/views/widgtes/select_city.dart';
import 'package:umra/pages/user/payment_methods/presentation/views/widgtes/select_country.dart';
import 'package:umra/pages/user/payment_methods/presentation/views/widgtes/select_desired_currency.dart';
import 'package:umra/widgets/custom_button.dart';
import 'package:umra/widgets/custom_text.dart';
import 'package:umra/widgets/custom_text_field_container.dart';
import 'package:umra/widgets/custom_text_form_field.dart';

class AddBankAccountView extends GetView<BankAccountController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(ColorCode.primary),
        title: CustomText(
          text: UserLang.bankAccount.tr(),
          textStyle: TextStyles.textBold18.copyWith(
              color: const Color(ColorCode.white), fontWeight: FontWeight.w700),
        ),
        elevation: .5,
        centerTitle: true,
      ),
      backgroundColor: const Color(ColorCode.white),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SelectDesiredCurrency(),
                    const SizedBox(height: 12,),

                    CustomText(
                      text: UserLang.mail.tr(),
                      textAlign: TextAlign.start,
                      textStyle:
                      TextStyles.textMedium18.copyWith(fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(ColorCode.brownishGrey)),
                    ),
                    CustomTextFieldContainer(

                        CustomTextFormField(
                          verticalPadding: 25,

                          hint: UserLang.mail.tr(),
                          onSave: (String? val) {
                            // controller.email = val!;
                          },
                          inputType: TextInputType.emailAddress,

                        )
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    CustomText(
                      text: UserLang.fullNameAccountHolder.tr(),
                      textAlign: TextAlign.start,
                      textStyle:
                      TextStyles.textMedium18.copyWith(fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(ColorCode.brownishGrey)),
                    ),
                    CustomTextFieldContainer(
                        CustomTextFormField(
                          verticalPadding: 25,

                          hint: UserLang.fullNameAccountHolder.tr(),
                          onSave: (String? val) {
                            // controller.email = val!;
                          },
                          inputType: TextInputType.emailAddress,

                        )
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    CustomText(
                      text:"SWIFT / BIC code",
                      textAlign: TextAlign.start,
                      textStyle:
                      TextStyles.textMedium18.copyWith(fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(ColorCode.brownishGrey)),
                    ),
                    CustomTextFieldContainer(
                        CustomTextFormField(
                          verticalPadding: 25,

                          hint: "SWIFT / BIC code",
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
                      text: UserLang.ibanAccountNumber.tr(),

                      textAlign: TextAlign.start,
                      textStyle:
                      TextStyles.textMedium18.copyWith(fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(ColorCode.brownishGrey)),
                    ),
                    CustomTextFieldContainer(
                        CustomTextFormField(
                          verticalPadding: 25,

                          hint:  UserLang.ibanAccountNumber.tr(),
                          onSave: (String? val) {
                            // controller.email = val!;
                          },
                          inputType: TextInputType.text,

                        )
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    SelectCountry(),
                    const SizedBox(height: 12,),
                    SelectCity(),
                    const SizedBox(height: 12,),

                    CustomText(
                      text: UserLang.recipientAddress.tr(),

                      textAlign: TextAlign.start,
                      textStyle:
                      TextStyles.textMedium18.copyWith(fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(ColorCode.brownishGrey)),
                    ),
                    CustomTextFieldContainer(
                        CustomTextFormField(
                          verticalPadding: 25,

                          hint:  UserLang.recipientAddress.tr(),
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
                      text: UserLang.postCode.tr(),

                      textAlign: TextAlign.start,
                      textStyle:
                      TextStyles.textMedium18.copyWith(fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(ColorCode.brownishGrey)),
                    ),
                    CustomTextFieldContainer(
                        CustomTextFormField(
                          verticalPadding: 25,

                          hint:  UserLang.postCode.tr(),
                          onSave: (String? val) {
                            // controller.email = val!;
                          },
                          inputType: TextInputType.text,

                        )
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      onPressed: () {},
                      backGroundColor: const Color(ColorCode.primary),
                      child: Text(
                        UserLang.add.tr(),
                        style: TextStyles.textMedium18
                            .copyWith(color: const Color(ColorCode.white)),
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }

}