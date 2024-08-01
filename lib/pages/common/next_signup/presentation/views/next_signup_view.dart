import 'package:country_picker/country_picker.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
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
import 'package:umra/pages/common/next_signup/model/country_city_response_model.dart';
import 'package:umra/pages/common/next_signup/presentation/controllers/next_signup_controller.dart';
import 'package:umra/pages/common/signup/presentation/views/widgets/appbar_widget.dart';
import 'package:umra/resources/common_assets.dart';
import 'package:umra/routes/common_routing/app_pages.dart';
import 'package:umra/services/auth_service.dart';
import 'package:umra/widgets/custom_button.dart';
import 'package:umra/widgets/custom_drop_down_widget.dart';
import 'package:umra/widgets/custom_text.dart';

class NextSignupView extends GetView<NextSignupController> {
  NextSignupView({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        height: 100.h,
        child: Padding(
          padding: const EdgeInsetsDirectional.only(
            top: 30,
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
                child: AuthService.to.language =="en"? Image.asset(AppAssets.backArrow(),color: Color(ColorCode.white),  ): Icon(Icons.arrow_back,color: Color(ColorCode.white),),
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
                      const SizedBox(
                        height: 32,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 34),
                        child: CustomText(
                          text: CommonLang.Phone.tr(),
                          textAlign: TextAlign.start,
                          textStyle: TextStyles.textMedium18.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: const Color(ColorCode.brownishGrey)),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Container(
                          height: 56,
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Obx(() => InkWell(
                                onTap: (){
                                  showCountryPicker(
                                    context: context,
                                    // //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
                                    // exclude: <String>['KN', 'MF'],
                                    // favorite: <String>['SE'],
                                    // //Optional. Shows phone code before the country name.
                                    showPhoneCode: true,
                                    onSelect: (Country country) {
                                      print('Select country: ${country.phoneCode}');
                                      print(country.flagEmoji);
                                      controller.selectedCountryPicker.value = country.phoneCode;
                                    },
                                    // Optional. Sets the theme for the country list picker.
                                    countryListTheme: CountryListThemeData(
                                      // Optional. Sets the border radius for the bottomsheet.
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(40.0),
                                        topRight: Radius.circular(40.0),
                                      ),
                                      // Optional. Styles the search field.
                                      inputDecoration: InputDecoration(
                                        labelText: 'Search',
                                        hintText: 'Start typing to search',
                                        prefixIcon: const Icon(Icons.search),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: const Color(0xFF8C98A8).withOpacity(0.2),
                                          ),
                                        ),
                                      ),
                                      searchTextStyle: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 18,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 56,
                                  width: 65,
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border:Border.all(width: 1,color: Color(ColorCode.whitelight))
                                  ),
                                  child: Center(
                                    child: CustomText(
                                      text:controller.selectedCountryPicker.value ,
                                      textStyle: TextStyles.textLarge.copyWith(
                                          color: Color(ColorCode.darkBlack)
                                      ),

                                    ),
                                  ),

                                ),
                              )),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Container(
                                    child: TextFormField(
                                      controller: controller.phoneEditController,
                                      decoration: InputDecoration(
                                        hintText: CommonLang.Phone.tr(),
                                        hintStyle: TextStyles.textMedium18.copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            color: const Color(ColorCode.brownishGrey)),
                                        labelStyle:
                                        TextStyles.textNormal18.copyWith(
                                          color: const Color(ColorCode.darkGray)
                                              .withOpacity(.6),
                                        ),
                                        border: const OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(16)),
                                          borderSide: BorderSide(
                                              color: Color(ColorCode.whitelight),
                                              width: 1),
                                        ),
                                        enabledBorder: const OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(16)),
                                          borderSide: BorderSide(
                                              color: Color(ColorCode.whitelight),
                                              width: 1),
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(16)),
                                          borderSide: BorderSide(
                                              color: Color(ColorCode.whitelight),
                                              width: 1),
                                        ),
                                        errorBorder: const OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(16)),
                                          borderSide: BorderSide(
                                              color: Colors.red, width: 1),
                                        ),
                                        focusedErrorBorder:
                                        const OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(16)),
                                          borderSide: BorderSide(
                                              color: Colors.red, width: 1),
                                        ),
                                        disabledBorder: const OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(16)),
                                          borderSide: BorderSide(
                                              color: Color(ColorCode.whitelight),
                                              width: 1),
                                        ),
                                        // fillColor: Colors.white,
                                        // filled: true,
                                        // contentPadding:
                                        // const EdgeInsets.symmetric(horizontal: 20, vertical: 16).r,
                                      ),
                                    ),
                                  ))
                              // Container(width: 100,height: 100,
                              //   child: CustomTextFieldContainer(
                              //
                              //       CustomTextFormField(
                              //
                              //         hint: CommonLang.Address.tr(),
                              //         onSave: (String? val) {
                              //           controller.email = val!;
                              //         },
                              //         inputType: TextInputType.text,
                              //
                              //       )
                              //   ),
                              // ),
                            ],
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 34),
                        child: CustomText(
                          text: CommonLang.Residencecountry.tr(),
                          textAlign: TextAlign.start,
                          textStyle: TextStyles.textMedium18.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: const Color(ColorCode.brownishGrey)),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Container(
                        height: 56,
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: CustomDropDownWidget<Countries>(
                            textStyles: TextStyles.textMedium18.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: const Color(ColorCode.brownishGrey)),
                            value: controller.selectedCountry.value,
                            items: controller.countryCityResponseModel?.countries ?? [],
                            onChange: (Countries? val) {
                              controller.selectedCountry.value = val!;
                              controller.selectedCity.value =  controller.selectedCountry.value.cities!.first;
                              controller.selectedCountryId = controller.selectedCountry.value.id;
                              controller.selectedCityId = controller.selectedCity.value.id;
                              controller.update();
                            }),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 34),
                        child: CustomText(
                          text: CommonLang.City.tr(),
                          textAlign: TextAlign.start,
                          textStyle: TextStyles.textMedium18.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: const Color(ColorCode.brownishGrey)),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Container(
                        height: 56,
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: CustomDropDownWidget<Cities>(
                            textStyles: TextStyles.textMedium18.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: const Color(ColorCode.brownishGrey),
                            ),
                            value: controller.selectedCity.value,
                            items: controller.selectedCountry.value.cities ?? [],
                            onChange: (Cities? value) {
                              controller.selectedCity.value = value!;
                              controller.selectedCityId = controller.selectedCity.value.id;

                              controller.update();
                            }),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 34),
                        child: CustomText(
                          text: CommonLang.Address.tr(),
                          textAlign: TextAlign.start,
                          textStyle: TextStyles.textMedium18.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: const Color(ColorCode.brownishGrey)),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: TextFormField(
                              controller: controller.addressEditController,
                              decoration: InputDecoration(
                                hintText: CommonLang.Address.tr(),
                                hintStyle: TextStyles.textMedium18.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: const Color(ColorCode.brownishGrey)),
                                labelStyle: TextStyles.textNormal18.copyWith(
                                  color: const Color(ColorCode.darkGray)
                                      .withOpacity(.6),
                                ),
                                border: const OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                                  borderSide: BorderSide(
                                      color: Color(ColorCode.whitelight), width: 1),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                                  borderSide: BorderSide(
                                      color: Color(ColorCode.whitelight), width: 1),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                                  borderSide: BorderSide(
                                      color: Color(ColorCode.whitelight), width: 1),
                                ),
                                errorBorder: const OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                                  borderSide:
                                  BorderSide(color: Colors.red, width: 1),
                                ),
                                focusedErrorBorder: const OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                                  borderSide:
                                  BorderSide(color: Colors.red, width: 1),
                                ),
                                disabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                                  borderSide: BorderSide(
                                      color: Color(ColorCode.whitelight), width: 1),
                                ),
                                // fillColor: Colors.white,
                                // filled: true,
                                // contentPadding:
                                // const EdgeInsets.symmetric(horizontal: 20, vertical: 16).r,
                              )))
                    ],
                  ),
                ),
              )),
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: CustomButton(
              width: double.infinity,
              height: 56,
              onPressed: () {
                print(controller.selectedCountryId);
                print(controller.selectedCityId);
                // if(Get.find<MyFlavorConfig>().appNameEnum == AppNameEnum.user){
                  controller.onUpdatProfileClicked();


              },
              backGroundColor: const Color(ColorCode.primary),
              child: CustomText(
                  text: Get.find<MyFlavorConfig>().appNameEnum == AppNameEnum.user ? CommonLang.signUp.tr() : CommonLang.next.tr(),
                  textStyle: TextStyles.textButton),
            ),
          ),
        ],
      ),onLoading: const SpinKitCircle(color: Color(ColorCode.primary))),
    );
  }
}
