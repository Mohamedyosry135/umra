import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:umra/lang/translation_service.dart';
import 'package:umra/pages/provider/provider_home/presentation/controller/provider_home_controller.dart';
import 'package:umra/pages/provider/provider_home/presentation/view/widgets/home_header_widget.dart';
import 'package:umra/resources/common_assets.dart';
import 'package:umra/routes/common_routing/app_pages.dart';
import 'package:umra/routes/provider_routing/provider_app_pages.dart';
import 'package:umra/widgets/home_controll_cell.dart';

class ProviderHomeView extends GetView<ProviderHomeController> {
  const ProviderHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsetsDirectional.only(bottom: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const HomeProviderHeaderWidget(),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: HomeControlCell(
                              onTap: () {
                                Get.rootDelegate
                                    .toNamed(ProviderRoutes.MY_REQUESTS);
                              },
                              image: AppAssets.MyOrders(),
                              value: CommonLang.MyOrders.tr(),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: HomeControlCell(
                              onTap: () {
                                Get.rootDelegate.toNamed(Routes.WALLET);
                              },
                              image: AppAssets.MyWallet(),
                              value: CommonLang.MyWallet.tr(),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: HomeControlCell(
                              onTap: () {
                                Get.rootDelegate.toNamed(Routes.myProfile);
                              },
                              image: AppAssets.MyProfile(),
                              value: CommonLang.MyProfile.tr(),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: HomeControlCell(
                              onTap: () {
                                Get.rootDelegate.toNamed(Routes.SUPPORT_CHAT);
                              },
                              image: AppAssets.ContactUs(),
                              value: CommonLang.ContactUs.tr(),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: HomeControlCell(
                              onTap: () {
                                Get.rootDelegate.toNamed(Routes.SETTINGS);
                              },
                              image: AppAssets.Settings(),
                              value: CommonLang.Settings.tr(),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(child: Container()),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
