import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/lang/translation_service.dart';
import 'package:umra/lang/user_translation_service.dart';
import 'package:umra/pages/user/add_beneficiary/presentation/controllers/add_beneficiary_controller.dart';
import 'package:umra/pages/user/add_beneficiary/presentation/view/widgets/beneficiary_info_widget.dart';
import 'package:intl/intl.dart';
import 'package:umra/pages/user/umrah_add_request/presentation/controllers/umrah_add_request_controller.dart';
import 'package:umra/resources/common_assets.dart';
import 'package:umra/widgets/custom_button.dart';
import 'package:umra/widgets/custom_text.dart';

class BeneficiaryReasonWidget extends GetView<UmrahAddRequestController> {
  const BeneficiaryReasonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UmrahAddRequestController>(builder: (cont) {
      return BeneficiaryInfoWidget(
        cellValue: controller.selctedReason != null
            ? controller.selctedReason!.name.toString()
            : UserLang.selectReason.tr(),
        cellTitle: UserLang.selectReason.tr(),
        cellWidget: WillPopScope(
          onWillPop: () async {
            if (controller.selctedReason == null) {
              controller.selctedReasonID.value = 80000;
            } else {
              controller.selctedReasonID.value = controller.selctedReason!.id!;
            }
            return true;
          },
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                CustomText(
                    text: UserLang.selectReason.tr(),
                    textStyle: TextStyles.textMedium18.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: const Color(ColorCode.darkBlue))),
                const SizedBox(
                  height: 22,
                ),
                Expanded(
                    child: ListView.separated(
                  itemCount: controller.staticReasonModel!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        controller.selctedReasonID.value =
                            controller.staticReasonModel![index].id!;
                      },
                      child: Container(
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                            color: const Color(ColorCode.white),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                color: Color(ColorCode.orangeFaded), width: 1)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                                text: controller.staticReasonModel![index].name
                                    .toString(),
                                textStyle: TextStyles.textMedium18.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: const Color(ColorCode.darkGray2))),
                            ObxValue<RxInt>((state) {
                              return controller.selctedReasonID.value ==
                                      controller.staticReasonModel![index].id
                                  ? Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: const Color(ColorCode.primary),
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      child: Image.asset(AppAssets.right()),
                                    )
                                  : SizedBox();
                            }, controller.selctedReasonID)
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 12,
                    );
                  },
                )),
                const SizedBox(
                  height: 22,
                ),
                CustomButton(
                  onPressed: () {
                    if (controller.selctedReasonID.value != 80000) {
                      controller.selctedReason = controller.staticReasonModel!
                          .firstWhere((element) =>
                              element.id == controller.selctedReasonID.value);
                      print(controller.selctedReason!.name);
                      controller.update();
                    }
                    Get.back();
                  },
                  backGroundColor: const Color(ColorCode.primary),
                  child: Text(
                    CommonLang.select.tr(),
                    style: TextStyles.textMedium18
                        .copyWith(color: const Color(ColorCode.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
