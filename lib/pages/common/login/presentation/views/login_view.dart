import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/lang/translation_service.dart';
import 'package:umra/pages/common/login/presentation/controllers/login_controller.dart';
import 'package:umra/pages/common/login/presentation/views/widgets/socials_btns.dart';
import 'package:umra/resources/common_assets.dart';
import 'package:umra/routes/common_routing/app_pages.dart';
import 'package:umra/services/auth_service.dart';
import 'package:umra/widgets/custom_button.dart';
import 'package:umra/widgets/custom_text.dart';
import 'package:umra/widgets/custom_text_form_field.dart';

import '../../../../../widgets/custom_text_field_container.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(ColorCode.white),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: AuthService.to.language =="en"? Image.asset(AppAssets.backArrow()  ): Icon(Icons.arrow_back,color: Color(ColorCode.black),),
        ),
      ),
      backgroundColor: const Color(ColorCode.white),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(
                      AppAssets.logoWithoutName(),
                      width: 70,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CustomText(
                      text: CommonLang.pleaseSignIn.tr(),
                      textAlign: TextAlign.start,
                      textStyle: TextStyles.textBold25.copyWith(
                          fontSize: 29, color: const Color(ColorCode.orangeFaded)),
                    ),
                    CustomText(
                      text: CommonLang.enterUrDipstoreAcc.tr(),
                      textAlign: TextAlign.start,
                      textStyle: TextStyles.textMedium18
                          .copyWith(color: Color(ColorCode.greyscale500)),
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // const SizedBox(
                          //   height: 15,
                          // ),
                          // if (controller.userType ?? false) SocialBtns(),
                          const SizedBox(
                            height: 45,
                          ),
                          CustomText(
                            text: CommonLang.usernameEmail.tr(),
                            textAlign: TextAlign.start,
                            textStyle: TextStyles.textMedium18.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color(ColorCode.brownishGrey)),
                          ),
                          CustomTextFieldContainer(CustomTextFormField(
                            hint: CommonLang.usernameEmail.tr(),
                            onSave: (String? val) {
                              controller.email = val!;
                            },
                            inputType: TextInputType.emailAddress,
                          )),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomText(
                            text: CommonLang.password.tr(),
                            textAlign: TextAlign.start,
                            textStyle: TextStyles.textMedium18.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color(ColorCode.brownishGrey)),
                          ),
                          ObxValue<RxBool>((state) {
                            return CustomTextFieldContainer(CustomTextFormField(
                              hint: CommonLang.password.tr(),
                              onSave: (String? val) {
                                controller.password = val!;
                              },
                              inputType: TextInputType.visiblePassword,
                              obscureText: true,
                              obscuringCharacter: "•",
                              isHiddenPassword: state.value,
                              onTapShowHidePassword: () =>
                                  controller.changeIsHiddenPassword(),
                            ));
                          }, controller.isHiddenPassword),
                          const SizedBox(
                            height: 12,
                          ),
                          InkWell(
                            onTap: (){
                              Get.rootDelegate.toNamed(Routes.FORGETPASSWORD);
                            },
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: CustomText(
                                text: "${CommonLang.forgotPassword.tr()}?",
                                textAlign: TextAlign.start,
                                textStyle: TextStyles.textBold18.copyWith(
                                    fontSize: 16, color: Color(ColorCode.primary)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            controller.obx((state) => CustomButton(
              onPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
                if ((formKey.currentState?.validate() ?? false)) {
                  formKey.currentState?.save();
                  controller.onLoginClicked();
                }
              },
              height: 45,
              backGroundColor: const Color(ColorCode.primary),
              child: CustomText(
                  text: CommonLang.signIn.tr(),
                  textStyle: TextStyles.textButton),
            ),onLoading:  const SpinKitCircle(color: Color(ColorCode.primary)))
          ],
        ),
      ),
    );
  }
}
