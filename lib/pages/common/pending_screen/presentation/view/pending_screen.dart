import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/pages/common/pending_screen/presentation/controller/pending_controller.dart';
import 'package:umra/resources/common_assets.dart';
import 'package:umra/routes/common_routing/app_pages.dart';
import 'package:umra/services/auth_service.dart';
import 'package:umra/widgets/custom_text.dart';

import '../../../../../consts/text_styles.dart';

class PendingView extends GetView<PendingController> {
  const PendingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(ColorCode.appbarGreen),
        automaticallyImplyLeading: false,
        // leading: InkWell(
        //   onTap: () {
        //     Get.rootDelegate.offNamed(Routes.signupView);
        //   },
        //   child: AuthService.to.language == "en"
        //       ? Image.asset(AppAssets.backArrow(),color: Color(ColorCode.white),)
        //       : Icon(
        //           Icons.arrow_back,
        //           color: Color(ColorCode.white),
        //         ),
        // ),
      ),
      body: Center(
          child: CustomText(
              text: 'your account is under review',
              textStyle: TextStyles.textBold18)),
    );
  }
}
