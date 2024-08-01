import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/flavors/flavor_config.dart';
import 'package:umra/lang/translation_service.dart';
import 'package:umra/pages/common/my_profile/presentation/controllers/my_profile_controller.dart';
import 'package:umra/pages/common/my_profile/presentation/view/widgets/be_provider_widget.dart';
import 'package:umra/pages/common/my_profile/presentation/view/widgets/profile_header_widget.dart';
import 'package:umra/resources/common_assets.dart';
import 'package:umra/routes/common_routing/app_pages.dart';
import 'package:umra/services/auth_service.dart';
import 'package:umra/widgets/custom_button.dart';
import 'package:umra/widgets/custom_text_field_container.dart';
import 'package:umra/widgets/custom_text_form_field.dart';

class MyProfileView extends GetView<MyProfileController> {
  const MyProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0.0,
        ),
        backgroundColor: const Color(ColorCode.white),
        body: controller.obx(
          (state) => SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileHeaderWidget(
                    profileImage: controller.profileModel?.result?.data
                            ?.profileAttachment?.filePath ??
                        ""),
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 35,
                      ),
                      if (Get.find<MyFlavorConfig>().appNameEnum ==
                          AppNameEnum.user)
                        const BeProviderWidget(),
                      CustomTextFieldContainer(
                        CustomTextFormField(
                          verticalPadding: 20,
                          hint: CommonLang.Fullname.tr(),
                          onSave: (String? val) {},
                          controller: controller.fullNameController,
                          prefixIcon: Image.asset(
                            AppAssets.personVector(),
                            height: 5,
                            width: 5,
                          ),
                          inputType: TextInputType.text,
                        ),
                        marginStart: 15,
                        marginEnd: 15,
                      ),
                      CustomTextFieldContainer(
                        CustomTextFormField(
                          verticalPadding: 20,
                          hint: CommonLang.Email.tr(),
                          onSave: (String? val) {},
                          controller: controller.emailController,
                          enabled: false,
                          prefixIcon: Image.asset(
                            AppAssets.emailIcon(),
                            height: 5,
                            width: 5,
                          ),
                          inputType: TextInputType.text,
                        ),
                        marginStart: 15,
                        marginEnd: 15,
                      ),
                      CustomTextFieldContainer(
                        CustomTextFormField(
                          verticalPadding: 20,
                          hint: CommonLang.Phone.tr(),
                          onSave: (String? val) {},
                          controller: controller.phoneController,
                          prefixIcon: Image.asset(
                            AppAssets.phoneIcon(),
                            height: 5,
                            width: 5,
                          ),
                          inputType: TextInputType.text,
                        ),
                        marginStart: 15,
                        marginEnd: 15,
                      ),
                    ],
                  ),
                )),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    child: CustomButton(
                      onPressed: () {
                        Get.rootDelegate.offAndToNamed(Routes.LANGUAGE);
                      },
                      backGroundColor: const Color(ColorCode.whitelight),
                      child: Text(
                        CommonLang.logout.tr(),
                        style: TextStyles.textMedium18
                            .copyWith(color: const Color(ColorCode.red)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          onLoading: const SpinKitCircle(color: Color(ColorCode.primary)),
        ));
  }
}
