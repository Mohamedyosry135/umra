import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/lang/translation_service.dart';
import 'package:umra/lang/user_translation_service.dart';
import 'package:umra/pages/user/payment_methods/presentation/controllers/bank_account_controller.dart';
import 'package:umra/resources/common_assets.dart';
import 'package:umra/widgets/custom_button.dart';
import 'package:umra/widgets/custom_text.dart';

import '../../../../add_beneficiary/presentation/view/widgets/beneficiary_info_widget.dart';

class SelectCountry extends GetView<BankAccountController> {
  const SelectCountry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return BeneficiaryInfoWidget(
        cellValue: controller.currencySelected.value,
        cellTitle: UserLang.country.tr(),
        cellWidget: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              CustomText(text: UserLang.country.tr(),
                  textStyle: TextStyles.textMedium18.copyWith(
                      fontWeight: FontWeight.w700,
                      color:const Color(ColorCode.brownishGrey)
                  )
              ),
              const SizedBox(height: 22,),
              Expanded(
                  child: ListView.separated(
                    itemCount: 3,
                    itemBuilder: (context, index){
                      return Obx(() => InkWell(
                        onTap: (){
                          controller.currencySelected.value = "USD";
                        },
                        child: Container(
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                              color: const Color(ColorCode.white),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color:  Color(controller.currencySelected.value == "USD" ?ColorCode.orangeFaded : ColorCode.whitelight) ,width: 1)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(text: "Egypt",
                                  textStyle: TextStyles.textMedium18.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color:const Color(ColorCode.darkGray2)
                                  )
                              ),
                              if(controller.currencySelected.value == "USD")
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Color(ColorCode.primary),
                                      borderRadius: BorderRadius.circular(7)
                                  ),
                                  child: Image.asset(AppAssets.right()),
                                )
                            ],
                          ),

                        ),
                      ));
                    }, separatorBuilder: (BuildContext context, int index) { return SizedBox(height: 12,); },
                  )
              ),
              const SizedBox(height: 22,),
              CustomButton(
                onPressed: (){
                  Get.back();
                },
                backGroundColor: const Color(ColorCode.primary),
                child: Text(
                  CommonLang.select.tr(),
                  style: TextStyles.textMedium18.copyWith(color: const Color(ColorCode.white)),
                ),
              ),

            ],
          ),
        ),
      );
    });
  }
}
