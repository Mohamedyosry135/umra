import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umra/consts/colors.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/flavors/flavor_config.dart';
import 'package:umra/lang/translation_service.dart';
import 'package:umra/pages/common/my_profile/presentation/view/widgets/be_provider_widget.dart';
import 'package:umra/pages/common/settings/presentation/controllers/settings_controller.dart';
import 'package:umra/pages/common/signup/presentation/views/widgets/appbar_widget.dart';
import 'package:umra/resources/common_assets.dart';
import 'package:umra/routes/common_routing/app_pages.dart';
import 'package:umra/routes/provider_routing/provider_app_pages.dart';
import 'package:umra/routes/user_routing/user_app_pages.dart';
import 'package:umra/widgets/custom_bottom_sheet.dart';
import 'package:umra/widgets/custom_text.dart';
import 'package:umra/pages/common/settings/presentation/views/widgets/settings_cell.dart';
import 'dart:math' as math;
import '../../../../../services/auth_service.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: HomeAppBar(
          height: 100.h,
          child: Padding(
            padding: EdgeInsets.only(left: 24, right: 50, top: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Transform(
                  alignment: Alignment.center,
                  transform: AuthService.to.language == 'ar'
                      ? Matrix4.rotationY(math.pi)
                      : Matrix4.rotationY(0),
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Image.asset(
                        width: 32,
                        height: 32,
                        AppAssets.backArrow(),
                        color: const Color(ColorCode.white)),
                  ),
                ),
                Expanded(
                  child: CustomText(
                    text: CommonLang.Settings.tr(),
                    textAlign: TextAlign.center,
                    textStyle: TextStyles.textNormal18.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 18.sp,
                        color: const Color(ColorCode.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Get.find<MyFlavorConfig>().appNameEnum == AppNameEnum.provider
                ? Container(
                    height: 110.h,
                    width: 327.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: const Color(ColorCode.settingsCard),
                    ),
                    child: Stack(
                      children: [
                        Align(
                            alignment: Alignment.centerRight,
                            child: Image.asset(AppAssets.wallet())),
                        PositionedDirectional(
                          top: 21.h,
                          start: 19.w,
                          child: SizedBox(
                            height: 69.h,
                            width: 69.w,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.r),
                              child: Image.asset(
                                AppAssets.settingsCardImage(),
                              ),
                            ),
                          ),
                        ),
                        PositionedDirectional(
                          top: 20.h,
                          start: 102.w,
                          bottom: 68.h,
                          child: Text(
                            AuthService.to.userInfo?.data?.appUsers?.fullName ?? '',
                            style: TextStyle(
                              color: const Color(ColorCode.greyscale900),
                              fontWeight: FontWeight.w700,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : const BeProviderWidget(),
            SizedBox(
              height: 25.h,
            ),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: CustomText(
                text: CommonLang.genralSettings.tr(),
                textStyle: TextStyle(
                  color: const Color(ColorCode.greyscale900),
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                ),
              ),
            ),
            SizedBox(
              height: 26.h,
            ),
            SettingsCell(
              prefixIcon: AppAssets.myAccountCell(),
              title: CommonLang.myAccount.tr(),
              onTap: () {
                Get.rootDelegate.toNamed(Routes.myProfile);
              },
            ),
            SizedBox(
              height: 24.h,
            ),
            if (controller.appType == AppNameEnum.provider)
              SettingsCell(
                prefixIcon: AppAssets.yourDaysCell(),
                title: CommonLang.yourDaysAvailable.tr(),
                onTap: () {
                  Get.rootDelegate.toNamed(ProviderRoutes.MY_DAYS);
                },
              ),
            if (controller.appType == AppNameEnum.user)
              SettingsCell(
                prefixIcon: AppAssets.myWalletCell(),
                title: CommonLang.paymentMethods.tr(),
                onTap: () {
                  Get.rootDelegate.toNamed(UserRoutes.PAYMENT);
                },
              ),
            if (controller.appType == AppNameEnum.provider)
              SizedBox(
                height: 24.h,
              ),
            if (controller.appType == AppNameEnum.provider)
              SettingsCell(
                prefixIcon: AppAssets.myWalletCell(),
                title: CommonLang.MyWallet.tr(),
                onTap: () {
                  Get.rootDelegate.toNamed(Routes.WALLET);
                },
              ),
            SizedBox(
              height: 24.h,
            ),
            SettingsCell(
              prefixIcon: AppAssets.languageCell(),
              title: CommonLang.language.tr(),
              onTap: () {
                customBottomSheet(
                    bottomSheetBody: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomText(
                          text: CommonLang.language.tr(),
                          textStyle: TextStyles.textBold22),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.updateLocale(const Locale('ar'));
                              AuthService.to.selectLanguage('ar');
                              Get.back();
                            },
                            child: CustomText(
                                text: 'العربية',
                                textStyle: TextStyles.textBold18),
                          ),
                          InkWell(
                            onTap: () {
                              Get.updateLocale(const Locale('en'));
                              AuthService.to.selectLanguage('en');
                              Get.back();
                            },
                            child: CustomText(
                                text: 'English',
                                textStyle: TextStyles.textBold18),
                          ),
                        ],
                      )
                    ],
                  ),
                ));
              },
            ),
            SizedBox(
              height: 24.h,
            ),
            SettingsCell(
              prefixIcon: AppAssets.notificationCell(),
              title: CommonLang.notifications.tr(),
              onTap: () {
                Get.rootDelegate.toNamed(Routes.NOTIFICATION);
              },
            ),
            SizedBox(
              height: 34.h,
            ),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: CustomText(
                text: CommonLang.other.tr(),
                textStyle: TextStyle(
                  color: const Color(ColorCode.greyscale900),
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                ),
              ),
            ),
            SizedBox(
              height: 26.h,
            ),
            SettingsCell(
              prefixIcon: AppAssets.supportCell(),
              title: CommonLang.support.tr(),
              onTap: () {
                Get.rootDelegate.toNamed(Routes.SUPPORT_CHAT);
              },
            ),
            SizedBox(
              height: 24.h,
            ),
            SettingsCell(
              prefixIcon: AppAssets.termsCell(),
              title: CommonLang.termsAndconditions.tr(),
              onTap: () {
                Get.rootDelegate.toNamed(Routes.TERMS_CONDITION);
              },
            ),
            SizedBox(
              height: 24.h,
            ),
            SettingsCell(
              prefixIcon: AppAssets.privacyCell(),
              title: CommonLang.privacyPolicy.tr(),
              onTap: () {
                Get.rootDelegate.toNamed(Routes.PRIVACY_POLICY);

              },
            ),
            SizedBox(
              height: 24.h,
            ),
            SettingsCell(
              prefixIcon: AppAssets.reviewCell(),
              title: CommonLang.reviewApp.tr(),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
