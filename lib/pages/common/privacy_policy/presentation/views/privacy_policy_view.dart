import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/lang/translation_service.dart';
import 'package:umra/pages/common/privacy_policy/presentation/controllers/privacy_policy_controller.dart';
import 'package:umra/pages/common/splash/presentation/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:umra/pages/common/terms_conditions/presentation/controllers/terms_condition_controller.dart';
import 'package:umra/resources/common_assets.dart';
import 'package:umra/widgets/custom_button.dart';
import 'package:umra/widgets/custom_text.dart';


class PrivacyPolicyView extends GetView<PrivacyPolicyController> {
  const PrivacyPolicyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(ColorCode.primary),
        title: CustomText(
          text: CommonLang.privacyPolicy.tr(),
          textStyle: TextStyles.textBold18.copyWith(
              color: const Color(ColorCode.white), fontWeight: FontWeight.w700),
        ),
        elevation: .5,
        centerTitle: true,
      ),
      backgroundColor: const Color(ColorCode.white),
      body: controller.obx((state) => SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomText(
          text:controller.termsAndConditionsModel?.data ??"",
                        textStyle: TextStyles.textMedium18.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Color(ColorCode.black),
                        ),
                        maxLines: 30,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      // ListView.separated(
                      //     physics:NeverScrollableScrollPhysics(),
                      //     shrinkWrap: true,
                      //     itemBuilder: (context,index){
                      //
                      //       return termsConditionWidget("Tt",index);
                      //     }, separatorBuilder: (context,index){
                      //   return SizedBox(height: 12,);
                      // }, itemCount: 6)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12,),
              CustomButton(
                onPressed: () {
                  Get.back();

                },
                width: 180,
                backGroundColor: const Color(ColorCode.primary),
                child: Text(
                  CommonLang.accept.tr(),
                  style: TextStyles.textMedium18
                      .copyWith(color: const Color(ColorCode.white)),
                ),
              ),
            ],
          ),
        ),
      ),onLoading: const SpinKitCircle(color: Color(ColorCode.primary))),
    );
  }

  termsConditionWidget(String text, index){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(ColorCode.pale)
          ),
          child: CustomText(
            text: "$index",
            textStyle: TextStyles.textMedium18.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Color(ColorCode.termsColor)
            ),
          ),
        ),
        SizedBox(width: 6,),
        Expanded(
          child: CustomText(text: "The Muslim performing Umrah on behalf of the deceased must have done Umrah on behalf of himself before. It is mustahabb for the pilgrim, The Muslim performing Umrah on behalf of the deceased must have done Umrah on behalf of himself before. It is mustahabb for the pilgrim,",
            textStyle: TextStyles.textMedium18.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 15,
              color: Color(ColorCode.termsColor),
            ),
            maxLines: 30,
            textAlign: TextAlign.start,
          ),
        )
      ],
    );
  }
}
