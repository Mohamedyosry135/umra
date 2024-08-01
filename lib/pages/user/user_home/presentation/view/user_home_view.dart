import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umra/lang/translation_service.dart';
import 'package:umra/pages/user/user_home/presentation/controller/user_home_controller.dart';
import 'package:umra/pages/user/user_home/presentation/view/widgets/home_header_widget.dart';
import 'package:umra/resources/common_assets.dart';
import 'package:umra/routes/common_routing/app_pages.dart';
import 'package:umra/routes/user_routing/user_app_pages.dart';
import 'package:umra/widgets/home_controll_cell.dart';


class UserHomeView extends GetView<UserHomeController> {
  const UserHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const HomeHeaderWidget(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: HomeControlCell(
                        onTap: (){
                          Get.rootDelegate.toNamed(UserRoutes.MY_REQUESTS);
                        },
                        image: AppAssets.requestIcon(),
                        value: CommonLang.myRequests.tr(),
                      ),
                    ),
                    const SizedBox(width: 15,),
                    Expanded(
                      child: HomeControlCell(
                        onTap: (){
                          Get.rootDelegate.toNamed(UserRoutes.MY_BENEFICIARY);
                        },
                        image: AppAssets.userVector(),
                        value: CommonLang.myBeneficiary.tr(),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: HomeControlCell(
                        onTap: (){
                          Get.rootDelegate.toNamed(UserRoutes.PAYMENT);
                        },
                        image: AppAssets.cardIcon(),
                        value: CommonLang.payment.tr(),
                      ),
                    ),
                    const SizedBox(width: 15,),
                    Expanded(
                      child: HomeControlCell(
                        onTap: (){
                          Get.rootDelegate.toNamed(Routes.SUPPORT_CHAT);
                        },
                        image: AppAssets.contactIcon(),
                        value: CommonLang.contactUs.tr(),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: HomeControlCell(
                        onTap: (){
                          Get.rootDelegate.toNamed(Routes.SETTINGS);
                        },
                        image: AppAssets.settingIcon(),
                        value: CommonLang.settings.tr(),
                      ),
                    ),
                    const SizedBox(width: 15,),
                    Expanded(
                      child: HomeControlCell(
                        onTap: (){
                          Get.rootDelegate.toNamed(Routes.myProfile);
                        },
                        image: AppAssets.userVector(),
                        value: CommonLang.myProfile.tr(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
