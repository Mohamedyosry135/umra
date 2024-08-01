import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/lang/translation_service.dart';
import 'package:umra/pages/common/signup/presentation/views/widgets/appbar_widget.dart';
import 'package:umra/resources/common_assets.dart';
import 'package:umra/routes/common_routing/app_pages.dart';
import 'package:umra/services/auth_service.dart';
import 'package:umra/widgets/custom_button.dart';
import 'package:umra/widgets/custom_text.dart';
import 'package:umra/widgets/custom_text_field_container.dart';
import 'package:umra/widgets/custom_text_form_field.dart';
import 'package:validators/validators.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  SignupView({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        height: 100.h,
        child: Padding(
          padding:const EdgeInsetsDirectional.only(top: 35,end: 50,start: 24,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: AuthService.to.language =="en"? Image.asset(AppAssets.backArrow() ,color: Color(ColorCode.white) ): Icon(Icons.arrow_back,color: Color(ColorCode.white),),
              ),
              Expanded(
                child: CustomText(
                  text: CommonLang.signUp.tr(),
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
      backgroundColor: const Color(ColorCode.white),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [

                        GetBuilder<SignupController>(builder: (cont){
                          return controller.image != null
                              ? Container(
                            padding: const EdgeInsets.all(8.0),
                            margin: EdgeInsets.only(top: 8),
                            width: 77.w,height: 77.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                                image:DecorationImage(
                                  image: FileImage(controller.image as File,scale: .5),
                                  fit: BoxFit.fill
                                )
                            ),
                          ):
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(AppAssets.avatar(),
                                width: 77.w, height: 77.h, fit: BoxFit.fill),
                          );
                        }),

                         Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: InkWell(
                            onTap: (){
                              controller.imagePick(ImageSource.gallery);
                            },
                            child: const CircleAvatar(
                                backgroundColor: Color(ColorCode.white),
                                radius: 12,
                                child: Icon(
                                  Icons.add_circle,
                                  color: Color(ColorCode.primary),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 34),
                    child: CustomText(
                      text: CommonLang.Fullname.tr(),
                      textAlign: TextAlign.start,
                      textStyle: TextStyles.textMedium18.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: const Color(ColorCode.brownishGrey)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: CustomTextFieldContainer(CustomTextFormField(
                      hint: CommonLang.Fullname.tr(),
                      onSave: (String? val) {
                        controller.fullName = val!;
                      },
                      inputType: TextInputType.name,
                    )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 34),
                    child: CustomText(
                      text: CommonLang.Username.tr(),
                      textAlign: TextAlign.start,
                      textStyle: TextStyles.textMedium18.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: const Color(ColorCode.brownishGrey)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: CustomTextFieldContainer(CustomTextFormField(
                      hint: CommonLang.Username.tr(),
                      onSave: (String? val) {
                        controller.userName = val!;
                      },
                      inputType: TextInputType.name,
                      validator: (value) {
                        return (value != null) ? null : "";
                      },
                    )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 34),
                    child: CustomText(
                      text: CommonLang.Email.tr(),
                      textAlign: TextAlign.start,
                      textStyle: TextStyles.textMedium18.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: const Color(ColorCode.brownishGrey)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: CustomTextFieldContainer(CustomTextFormField(
                      hint: CommonLang.Email.tr(),
                      onSave: (String? val) {
                        controller.email = val!;
                      },
                      validator: (value) {
                        return (value != null ) ? null : "";
                      },
                      inputType: TextInputType.emailAddress,
                    )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 34),
                    child: CustomText(
                      text: CommonLang.password.tr(),
                      textAlign: TextAlign.start,
                      textStyle: TextStyles.textMedium18.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: const Color(ColorCode.brownishGrey)),
                    ),
                  ),
                  ObxValue<RxBool>((state) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: CustomTextFieldContainer(CustomTextFormField(
                        hint: CommonLang.password.tr(),
                        onSave: (String? val) {
                          controller.password = val!;
                        },
                        validator: (value) {
                          return (value != null ) ? null : CommonLang.passwordNotEqual.tr();
                        },
                        inputType: TextInputType.visiblePassword,
                        obscureText: true,
                        obscuringCharacter: "•",
                        isHiddenPassword: state.value,
                        onTapShowHidePassword: () =>
                            controller.changeIsHiddenPassword1(),
                      )),
                    );
                  }, controller.isHiddenPassword1),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 34),
                    child: CustomText(
                      text: CommonLang.ConfirmPassword.tr(),
                      textAlign: TextAlign.start,
                      textStyle: TextStyles.textMedium18.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: const Color(ColorCode.brownishGrey)),
                    ),
                  ),
                  ObxValue<RxBool>((state) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: CustomTextFieldContainer(CustomTextFormField(
                        hint: CommonLang.ConfirmPassword.tr(),
                        onSave: (String? val) {
                          controller.confirmPassword = val!;
                        },
                        inputType: TextInputType.visiblePassword,
                        obscureText: true,
                        obscuringCharacter: "•",
                        isHiddenPassword: state.value,
                        validator: (value) {
                          return (value != null  ) ? null : CommonLang.passwordNotEqual.tr();
                        },
                        onTapShowHidePassword: () =>
                            controller.changeIsHiddenPassword(),
                      )),
                    );
                  }, controller.isHiddenPassword),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          )),
          controller.obx((state) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 24),
            child: CustomButton(
              width: double.infinity,
              height: 56,
              onPressed: () {
                if ((formKey.currentState?.validate() ?? false)) {
                  formKey.currentState?.save();
                  controller.onAddUser();
                }
              },
              backGroundColor: const Color(ColorCode.primary),
              child: CustomText(
                  text: CommonLang.next.tr(), textStyle: TextStyles.textButton),
            ),
          ),onLoading:   const SpinKitCircle(color: Color(ColorCode.primary)))
        ],
      ),
    );
  }
}
