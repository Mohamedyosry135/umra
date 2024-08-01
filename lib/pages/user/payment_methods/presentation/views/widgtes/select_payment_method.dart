import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/lang/translation_service.dart';
import 'package:umra/lang/user_translation_service.dart';
import 'package:umra/pages/user/add_beneficiary/presentation/view/widgets/beneficiary_info_widget.dart';
import 'package:umra/pages/user/payment_methods/presentation/controllers/payment_methods_controller.dart';
import 'package:umra/pages/user/umrah_add_request/presentation/view/widgets/select_payment_methods.dart';
import 'package:umra/resources/common_assets.dart';
import 'package:umra/routes/user_routing/user_app_pages.dart';
import 'package:umra/widgets/custom_button.dart';
import 'package:umra/widgets/custom_text.dart';

class SelectPaymentMethodWidget extends GetView<PaymentMethodsController> {
  const SelectPaymentMethodWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15,right: 15,bottom: 15,top: 25),
      child: Column(
        children: [
          CustomText(text: UserLang.selectPaymentMethod.tr(),
              textStyle: TextStyles.textMedium18.copyWith(
                  fontWeight: FontWeight.w700,
                  color:const Color(ColorCode.darkGray2)
              )
          ),
          const SizedBox(height: 22,),
          Expanded(
              child: ListView.separated(
                itemCount: controller.methods.length,
                itemBuilder: (context, index){
                  return Obx(() => InkWell(
                    onTap: (){
                      controller.methodPayment.value =controller.methods[index];
                    },
                    child: Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                          color: const Color(ColorCode.white),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color:  Color(controller.methodPayment.value ==controller.methods[index] ?ColorCode.orangeFaded : ColorCode.whitelight) ,width: 1)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(text: controller.methods[index],
                              textStyle: TextStyles.textMedium18.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color:const Color(ColorCode.darkGray2)
                              )
                          ),
                          if(controller.methodPayment.value ==controller.methods[index])
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
              if(controller.methodPayment.value == 'Bank Account'){
                Get.rootDelegate.toNamed(UserRoutes.ADD_BANK_ACCOUNT);
              }else if(controller.methodPayment.value == 'Credit Card/Debit Card'){
    Get.rootDelegate.toNamed(UserRoutes.ADD_CREDIT_CARD);
              }
            },
            backGroundColor: const Color(ColorCode.primary),
            child: Text(
              CommonLang.select.tr(),
              style: TextStyles.textMedium18.copyWith(color: const Color(ColorCode.white)),
            ),
          ),

        ],
      ),
    );
  }
}
