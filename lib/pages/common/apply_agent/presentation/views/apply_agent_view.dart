import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/flavors/flavor_config.dart';
import 'package:umra/lang/translation_service.dart';
import 'package:umra/pages/common/apply_agent/model/identity_type_model.dart';
import 'package:umra/pages/common/apply_agent/model/nationality_type_model.dart';
import 'package:umra/pages/common/signup/presentation/views/widgets/appbar_widget.dart';
import 'package:umra/routes/common_routing/app_pages.dart';
import 'package:umra/routes/provider_routing/provider_app_pages.dart';
import 'package:umra/routes/user_routing/user_app_pages.dart';
import 'package:umra/services/auth_service.dart';
import 'package:umra/widgets/custom_button.dart';
import 'package:umra/widgets/custom_text.dart';
import 'package:umra/widgets/custom_text_field_container.dart';
import 'package:umra/widgets/custom_text_form_field.dart';
import 'package:validators/validators.dart';

import '../../../../../lang/provider_translation_service.dart';
import '../../../../../resources/common_assets.dart';
import '../../../../../widgets/custom_drop_down_widget.dart';
import '../controllers/apply_agent_controller.dart';

class ApplyAgentView extends GetView<ApplyAgentController> {
  ApplyAgentView({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        height: 100.h,
        child: Padding(
          padding: EdgeInsets.only(left: 24, right: 50, top: 24.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: AuthService.to.language =="en"? Image.asset(AppAssets.backArrow(),color: Color(ColorCode.white) ): Icon(Icons.arrow_back,color: Color(ColorCode.white),),
              ),
              Expanded(
                child: CustomText(
                  text: CommonLang.signUp.tr(),
                  textAlign: TextAlign.center,
                  textStyle: TextStyles.textNormal18.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Color(ColorCode.white)),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color(ColorCode.white),
      body: controller.obx((state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 32,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 34, right: 34),
                        child: CustomText(
                          text: CommonLang.Nationality.tr(),
                          textAlign: TextAlign.start,
                          textStyle: TextStyles.textMedium18.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Color(ColorCode.brownishGrey)),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Container(
                        height: 56,
                        padding: EdgeInsets.only(left: 24, right: 24),
                        child: CustomDropDownWidget<NationalityDetails>(
                            textStyles: TextStyles.textMedium18.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Color(ColorCode.black)),
                            value: controller.selectedNationality.value,
                            items: controller.nationalityTypeModel?.data ??[],
                            onChange: (NationalityDetails? val) {
                              controller.selectedNationality.value =  val!;
                              controller.selectedNationalityId = val.id;
                              controller.update();
                            }),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 34, right: 34),
                        child: CustomText(
                          text: CommonLang.identitytype.tr(),
                          textAlign: TextAlign.start,
                          textStyle: TextStyles.textMedium18.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Color(ColorCode.brownishGrey)),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Container(
                        height: 56,
                        padding: EdgeInsets.only(left: 24, right: 24),
                        child: CustomDropDownWidget<IdentityType>(
                            textStyles: TextStyles.textMedium18.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Color(ColorCode.black)),
                            value: controller.selectedIdentityType.value,
                            items: controller.identityTypeModel?.data ??[],
                            onChange: (IdentityType? value) {
                              controller.selectedIdentityType.value = value!;
                              controller.selectedIdentityTypeId = value.id;
                              controller.update();
                            }),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 34, right: 34),
                        child: CustomText(
                          text: CommonLang.identitynumber.tr(),
                          textAlign: TextAlign.start,
                          textStyle: TextStyles.textMedium18.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Color(ColorCode.brownishGrey)),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 24, right: 24),

                        child: CustomTextFieldContainer(

                            CustomTextFormField(
                                hint: CommonLang.identitynumber.tr(),
                                onSave: (String? val) {
                                  controller.idNumberController.text = val!;
                                },
                                inputType: TextInputType.number,
                                controller: controller.idNumberController,
                              validator: (String? value){
                                return value == null || value.length >=10  ? null : CommonLang.validIdNumber.tr();
                                },

                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 34, right: 34),
                        child: CustomText(
                          text: CommonLang.ExpiryDate.tr(),
                          textAlign: TextAlign.start,
                          textStyle: TextStyles.textMedium18.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Color(ColorCode.brownishGrey)),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 24, right: 24),

                        child: CustomTextFieldContainer(

                            CustomTextFormField(
                          hint: CommonLang.ExpiryDate.tr(),
                          onSave: (String? val) {
                            controller.expiredDateController.text = val!;
                          },
                          inputType: TextInputType.datetime,
                                controller: controller.expiredDateController,
                          readOnly:true,
                          onTap:(){
                            print("dsadas");
                            controller.pickDate(context);
                          }
                        )),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 34, right: 34),
                        child: CustomText(
                          text: CommonLang.Uploadfile.tr(),
                          textAlign: TextAlign.start,
                          textStyle: TextStyles.textMedium18.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Color(ColorCode.brownishGrey)),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      GetBuilder<ApplyAgentController>(builder: (cont){
                        return Container(
                          padding: EdgeInsets.only(left: 24, right: 24),
                          child: Row(
                            children: [
                              Expanded(
                                child: DottedBorder(
                                    borderType: BorderType.RRect,
                                    radius: Radius.circular(12),
                                    dashPattern: [2, 2],
                                    color: Color(ColorCode.whitelight),
                                    strokeWidth: 1,
                                    child:cont.frontIdImage != null ?
                                    Center(
                                      child: Container(
                                        margin: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                                        padding: EdgeInsets.all(2),
                                        width: 75,
                                        height: 75,
                                        clipBehavior:
                                        Clip.antiAliasWithSaveLayer,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,

                                          image:  DecorationImage(
                                            image: FileImage(
                                                cont.frontIdImage!,
                                                scale: .5) ,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: InkWell(
                                            onTap: (){
                                              cont.frontIdImage = null;
                                              controller.update();
                                            },
                                            child: Icon(
                                              Icons.close,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ):
                                    InkWell(
                                      onTap: (){
                                        cont.openBottomSheet(context, true);
                                      },
                                      child: Container(
                                        height: 100,
                                        child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Center(
                                                  child: Image.asset(
                                                    AppAssets.IDFront(),
                                                    height: 35,
                                                    width: 35,
                                                  )),
                                              CustomText(
                                                text: ProviderLang.IDFront.tr(),
                                                textAlign: TextAlign.start,
                                                textStyle: TextStyles.textMedium18
                                                    .copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color: Color(ColorCode
                                                        .greyscale900)
                                                        .withOpacity(0.3)),
                                              ),
                                            ]),
                                      ),
                                    )
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: DottedBorder(
                                    borderType: BorderType.RRect,
                                    radius: Radius.circular(12),
                                    dashPattern: [2, 2],
                                    color: Color(ColorCode.whitelight),
                                    strokeWidth: 1,
                                    child:cont.backIdImage != null ?
                                    Center(
                                      child: Container(
                                        margin: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                                        padding: EdgeInsets.all(2),
                                        width: 75,
                                        height: 75,
                                        clipBehavior:
                                        Clip.antiAliasWithSaveLayer,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,

                                          image:  DecorationImage(
                                            image: FileImage(
                                                cont.backIdImage!,
                                                scale: .5) ,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: InkWell(
                                            onTap: (){
                                              cont.backIdImage = null;
                                              cont.update();
                                            },
                                            child: Icon(
                                              Icons.close,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ):
                                    InkWell(
                                      onTap: (){
                                        cont.openBottomSheet(context, false);
                                      },
                                      child: Container(
                                        height: 100,
                                        child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Center(
                                                  child: Image.asset(
                                                    AppAssets.IDFront(),
                                                    height: 35,
                                                    width: 35,
                                                  )),
                                              CustomText(
                                                text: ProviderLang.IDBack.tr(),
                                                textAlign: TextAlign.start,
                                                textStyle: TextStyles.textMedium18
                                                    .copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color: Color(ColorCode
                                                        .greyscale900)
                                                        .withOpacity(0.3)),
                                              ),
                                            ]),
                                      ),
                                    )
                                ),
                              ),
                            ],
                          ),
                        );
                      })
                    ],
                  ),
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
            child: controller.obx((state) => CustomButton(
              width: double.infinity,
              height: 56,
              onPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
                if ((formKey.currentState?.validate() ?? false)) {
                  print("Enter");
                  formKey.currentState?.save() ;
                  if(controller.frontIdImage != null && controller.backIdImage != null && controller.expiredDateController.text.isNotEmpty
                      && controller.idNumberController.text.isNotEmpty&& controller.selectedIdentityTypeId != null && controller.selectedNationalityId != null){

                    controller.requestModelFinalStep.identityNumber = controller.idNumberController.text;
                    controller.requestModelFinalStep.expireDate = controller.expiredDateController.text;
                    controller.requestModelFinalStep.nationalityId = controller.selectedNationalityId;
                    controller.requestModelFinalStep.identityType = controller.selectedIdentityTypeId;
                    controller.requestModelFinalStep.id = AuthService.to.userInfo?.data?.appUsers?.id;

                    print( controller.requestModelFinalStep.toJson());

                    controller.onClickWaitReview();
                  }else{
                    Get.snackbar("", CommonLang.fillData.tr());
                  }
                }
              },
              backGroundColor: const Color(ColorCode.primary),
              child: CustomText(
                  text: CommonLang.WaitforReview.tr(),
                  textStyle: TextStyles.textButton),
            ),onLoading: const SpinKitCircle(color: Color(ColorCode.primary))),
          ),
        ],
      ),onLoading:  const SpinKitCircle(color: Color(ColorCode.primary))),
    );
  }
}
