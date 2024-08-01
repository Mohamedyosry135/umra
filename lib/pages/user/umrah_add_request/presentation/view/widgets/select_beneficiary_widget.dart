import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/lang/translation_service.dart';
import 'package:umra/lang/user_translation_service.dart';
import 'package:umra/pages/user/add_beneficiary/bindings/add_beneficiary_binding.dart';
import 'package:umra/pages/user/add_beneficiary/presentation/controllers/add_beneficiary_controller.dart';
import 'package:umra/pages/user/add_beneficiary/presentation/view/widgets/beneficiary_info_widget.dart';
import 'package:intl/intl.dart';
import 'package:umra/pages/user/umrah_add_request/presentation/controllers/umrah_add_request_controller.dart';
import 'package:umra/pages/user/umrah_add_request/presentation/view/widgets/beneficiary_with_cell_widget.dart';
import 'package:umra/widgets/custom_button.dart';
import 'package:umra/widgets/custom_text.dart';
import 'package:umra/resources/common_assets.dart';

import '../../../../../../routes/common_routing/app_pages.dart';
import '../../../../../../routes/user_routing/user_app_pages.dart';
import '../../../../my_beneficiary/bindings/my_beneficiary_binding.dart';
import '../../../../my_beneficiary/data/my_beneficiary_repository.dart';
import '../../../../my_beneficiary/presentation/controllers/my_beneficiary_controller.dart';

class SelectBeneficiaryWidget extends GetView<UmrahAddRequestController> {
  @override
  Widget build(BuildContext context) {
    return BeneficiaryWithCellWidget(
      customWidget: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                color: const Color(ColorCode.white),
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(
                    color: Color(controller.reasonSelected.value == "Dead"
                        ? ColorCode.orangeFaded
                        : ColorCode.whitelight),
                    width: 1)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.network(
                "https://media.istockphoto.com/id/476085198/photo/businessman-silhouette-as-avatar-or-default-profile-picture.jpg?s=612x612&w=0&k=20&c=GVYAgYvyLb082gop8rg0XC_wNsu0qupfSLtO7q9wu38=",
                height: 40,
                width: 40,
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          GetBuilder<UmrahAddRequestController>(builder: (cont) {
            return CustomText(
                text: controller.selctedBeneficiary != null
                    ? controller.selctedBeneficiary!.legalName.toString()
                    : UserLang.selectBeneficiary.tr(),
                textStyle: TextStyles.textMedium18.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: const Color(ColorCode.darkBlue)));
          }),
        ],
      ),
      cellTitle: UserLang.selectBeneficiary.tr(),
      cellWidget: WillPopScope(
        onWillPop: () async {
          if (controller.selctedBeneficiary == null) {
            controller.selctedBeneficiaryID.value = 80000;
          } else {
            controller.selctedBeneficiaryID.value =
                controller.selctedBeneficiary!.id!;
          }
          return true;
        },
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              CustomText(
                  text: UserLang.selectBeneficiary.tr(),
                  textStyle: TextStyles.textMedium18.copyWith(
                      fontWeight: FontWeight.w700,
                      color: const Color(ColorCode.darkGray2))),
              const SizedBox(
                height: 22,
              ),
              if (controller.beneficiaryDetilsList?.isNotEmpty ?? true)
                Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              controller.selctedBeneficiaryID.value =
                                  controller.beneficiaryDetilsList![index].id!;
                            },
                            child: Container(
                              padding: const EdgeInsets.all(18),
                              decoration: BoxDecoration(
                                  color: const Color(ColorCode.white),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      color: const Color(ColorCode.orangeFaded),
                                      width: 1)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: const Color(ColorCode.white),
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            border: Border.all(
                                                color: Color(
                                                    ColorCode.orangeFaded),
                                                width: 1)),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          child: Image.network(
                                            "https://media.istockphoto.com/id/476085198/photo/businessman-silhouette-as-avatar-or-default-profile-picture.jpg?s=612x612&w=0&k=20&c=GVYAgYvyLb082gop8rg0XC_wNsu0qupfSLtO7q9wu38=",
                                            height: 65,
                                            width: 65,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                              text: controller
                                                  .beneficiaryDetilsList![index]
                                                  .legalName
                                                  .toString(),
                                              textStyle: TextStyles.textMedium18
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: const Color(
                                                          ColorCode.darkBlue))),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          CustomText(
                                              text: controller.relationships!
                                                  .firstWhere((element) =>
                                                      element.id ==
                                                      controller
                                                          .beneficiaryDetilsList![
                                                              index]
                                                          .relationShip)
                                                  .name
                                                  .toString(),
                                              textStyle: TextStyles.textMedium18
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                      color: const Color(
                                                          ColorCode
                                                              .textLight))),
                                        ],
                                      ),
                                    ],
                                  ),
                                  ObxValue<RxInt>((state) {
                                    return controller
                                                .selctedBeneficiaryID.value ==
                                            controller
                                                .beneficiaryDetilsList![index]
                                                .id
                                        ? Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                                color: const Color(
                                                    ColorCode.primary),
                                                borderRadius:
                                                    BorderRadius.circular(7)),
                                            child:
                                                Image.asset(AppAssets.right()),
                                          )
                                        : SizedBox();
                                  }, controller.selctedBeneficiaryID)
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 20,
                          );
                        },
                        itemCount: controller.beneficiaryDetilsList!.length)),
              if (controller.beneficiaryDetilsList?.isEmpty ?? false)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                          text: 'لا يوجد مستفيدين',
                          textStyle: TextStyles.textBold18),
                    ],
                  ),
                ),
              const SizedBox(
                height: 20,
              ),
              if (controller.beneficiaryDetilsList?.isNotEmpty ?? true)
                CustomButton(
                  onPressed: () {
                    if (controller.selctedBeneficiaryID.value != 80000) {
                      controller.selctedBeneficiary = controller
                          .beneficiaryDetilsList!
                          .firstWhere((element) =>
                              element.id ==
                              controller.selctedBeneficiaryID.value);
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
              if (controller.beneficiaryDetilsList?.isEmpty ?? false)
                Obx(
                  () => CustomButton(
                    onPressed: () async {
                      controller.navigateToAdd();

                    },
                    backGroundColor: const Color(ColorCode.primary),
                    child: controller.toAddLoading.value == false
                        ? Text(
                            CommonLang.add.tr(),
                            style: TextStyles.textMedium18
                                .copyWith(color: const Color(ColorCode.white)),
                          )
                        : Center(
                            child: SpinKitCircle(
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
