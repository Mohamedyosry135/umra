import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/lang/translation_service.dart';
import 'package:umra/pages/common/login/presentation/controllers/login_controller.dart';
import 'package:umra/pages/common/login/presentation/views/widgets/socials_btns.dart';
import 'package:umra/pages/common/verification_code/presentation/controllers/verfication_code_controller.dart';
import 'package:umra/resources/common_assets.dart';
import 'package:umra/routes/common_routing/app_pages.dart';
import 'package:umra/routes/provider_routing/provider_app_pages.dart';
import 'package:umra/routes/user_routing/user_app_pages.dart';
import 'package:umra/services/auth_service.dart';
import 'package:umra/widgets/custom_button.dart';
import 'package:umra/widgets/custom_text.dart';
import 'package:umra/widgets/custom_text_form_field.dart';

import '../../../../../widgets/custom_text_field_container.dart';

class VerificationCodeView extends GetView<VerificationCodeController> {
  VerificationCodeView({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(ColorCode.primary),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: AuthService.to.language =="en"? Image.asset(AppAssets.backArrow() ,color:Color(ColorCode.white) ): Icon(Icons.arrow_back,color: Color(ColorCode.white),),
        ),
      ),
      backgroundColor: const Color(ColorCode.white),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Expanded(
                child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    text: CommonLang.enterCode.tr(),
                    textAlign: TextAlign.start,
                    textStyle: TextStyles.textBold25.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: const Color(ColorCode.orangeFaded)),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  CustomText(
                    text: "${CommonLang.codeSentTo.tr()} ${controller.emailOrPhone}",
                    textAlign: TextAlign.center,
                    textStyle: TextStyles.textMedium18.copyWith(
                        color: const Color(ColorCode.greyscale500), fontSize: 14),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  PinCodeTextField(
                    appContext: context,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    keyboardType: const TextInputType.numberWithOptions(),
                    controller: controller.pinCodeController,
                    autoDisposeControllers: true,
                    length: 4,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    animationDuration: const Duration(milliseconds: 300),
                    // enableActiveFill: true,
                    backgroundColor: Colors.white,
                    textStyle:
                        const TextStyle(color: Color(ColorCode.greyscale900), fontSize: 16),
                    pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(12),
                        borderWidth: 1,
                        activeColor: const Color(ColorCode.primary),
                        inactiveColor: const Color(ColorCode.greyscale500),
                        activeFillColor: const Color(ColorCode.greyscale500),
                        fieldHeight: MediaQuery.of(context).size.width * 0.14,
                        fieldWidth: MediaQuery.of(context).size.width * 0.14,
                        disabledColor: const Color(ColorCode.red),
                        inactiveFillColor: const Color(ColorCode.white),
                        selectedFillColor: const Color(ColorCode.greyscale500),
                        selectedColor: const Color(ColorCode.greyscale500),
                        errorBorderColor: const Color(ColorCode.red)),
                    onChanged: (value) {
                      // controller.pinCodeController.text = value;
                      print(controller.pinCodeController.text);
                    },
                  )
                ],
              ),
            )),
            controller.obx((state) => CustomButton(
              onPressed: () {
                print(controller.pinCodeController.text);
                if(controller.pinCodeController.text.length == 4){
                  controller.onVerifyClicked();
                }
              },
              backGroundColor: const Color(ColorCode.primary),
              child: CustomText(
                  text: CommonLang.verify.tr(),
                  textStyle: TextStyles.textButton),
            ),onLoading: const SpinKitCircle(color: Color(ColorCode.primary)))
          ],
        ),
      ),
    );
  }
}
