import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:umra/pages/common/forget_password/presentation/controller/forget_password_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:umra/widgets/custom_text_form_field.dart';
import '../../../../../consts/colors.dart';
import '../../../../../consts/text_styles.dart';
import '../../../../../lang/translation_service.dart';
import '../../../../../resources/common_assets.dart';
import '../../../../../routes/common_routing/app_pages.dart';
import '../../../../../services/auth_service.dart';
import '../../../../../widgets/custom_button.dart';
import '../../../../../widgets/custom_text.dart';
import '../../../../../widgets/home_appbar.dart';
import 'dart:math' as math;

class ForgetPasswordView extends GetView<ForgetPasswordController> {
var formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        height: 100.h,
        child: Padding(
          padding: const EdgeInsetsDirectional.only(
            top: 35,
            end: 50,
            start: 24,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Transform(
                  alignment: Alignment.center,
                  transform: AuthService.to.language == 'ar'
                      ? Matrix4.rotationY(math.pi)
                      : Matrix4.rotationY(0),
                  child: Image.asset(
                      width: 32,
                      height: 32,
                      AppAssets.backArrow(),
                      color: const Color(ColorCode.white)),
                ),
              ),
              Expanded(
                child: CustomText(
                  text: CommonLang.forgotPassword.tr(),
                  textAlign: TextAlign.center,
                  textStyle: TextStyles.textNormal18.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: const Color(ColorCode.white)),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0.w),
        child: Column(
          children: [
            SizedBox(
              height: 150.h,
            ),
            CustomText(
                text: 'Please enter your email address to reset your password',
                textStyle: TextStyles.textSmall.copyWith(
                    fontSize: 14.sp, color: Color(ColorCode.greyscale500))),
            SizedBox(
              height: 40.h,
            ),
            Row(
              children: [
                CustomText(
                    text: CommonLang.usernameEmail.tr(),
                    textAlign: TextAlign.start,
                    textStyle: TextStyles.textSmall.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(ColorCode.brownishGrey))),
                Spacer()
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Form(
              key: formKey,
              child: CustomTextFormField(
                  hint: CommonLang.usernameEmail.tr(),
                  controller: controller.emailController,
                  onSave: (v) {},validator: (v){
                    if(v!.isEmpty ){
                      return CommonLang.enterEmail.tr();
                    }
              },
                  inputType: TextInputType.emailAddress),
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0.h),
        child: controller.obx((state) => CustomButton(
          onPressed: () {
            FocusManager.instance.primaryFocus?.unfocus();

            if ((formKey.currentState?.validate() ?? false)) {
              formKey.currentState?.save();
              controller.onClickResetPassword();
            }
          },
          height: 45,
          backGroundColor: const Color(ColorCode.primary),
          child: CustomText(
              text: CommonLang.reserPassword.tr(), textStyle: TextStyles.textButton),
        ),onLoading: const SpinKitCircle(color: Color(ColorCode.primary))),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
