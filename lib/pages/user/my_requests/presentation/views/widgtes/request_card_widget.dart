import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/lang/user_translation_service.dart';
import 'package:umra/pages/user/my_requests/presentation/controllers/my_requests_controller.dart';
import 'package:umra/pages/user/umrah_add_request/models/umra_request_model.dart';
import 'package:umra/resources/common_assets.dart';
import 'package:umra/routes/common_routing/app_pages.dart';
import 'package:umra/routes/user_routing/user_app_pages.dart';
import 'package:umra/services/auth_service.dart';
import 'package:umra/widgets/custom_text.dart';

class RequestCardWidget extends GetView<MyRequestsController> {
  RequestCardWidget({required this.model, super.key});
  final UmraRequestData model;
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){
        Get.rootDelegate.toNamed(
          UserRoutes.TRACK_ORDER,
          arguments:{
            "id" : model.id.toString()
          }
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(21),
          border: Border.all(color: const Color(ColorCode.whitelight), width: 1),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(ColorCode.grayCard),
                borderRadius: BorderRadius.circular(21),
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(ColorCode.white),
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                            color: const Color(ColorCode.whitelight), width: 1)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.network(
                        "https://media.istockphoto.com/id/476085198/photo/businessman-silhouette-as-avatar-or-default-profile-picture.jpg?s=612x612&w=0&k=20&c=GVYAgYvyLb082gop8rg0XC_wNsu0qupfSLtO7q9wu38=",
                        height: 60,
                        width: 50,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                                text: model.beneficiaryName.toString(),
                                textStyle: TextStyles.textMedium18.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: const Color(ColorCode.darkBlue))),
                            InkWell(
                              onTap: () {
                                Get.rootDelegate.toNamed(UserRoutes.UMRA_DONE);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 12),
                                decoration: BoxDecoration(
                                    color: Color(model.requestStatus == 1
                                        ? ColorCode.pale
                                        : ColorCode.lightGreen),
                                    borderRadius: BorderRadius.circular(100)),
                                child: CustomText(
                                    text: model.requestStatusName.toString(),
                                    textStyle: TextStyles.textMedium18.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color: Color(model.requestStatus == 1
                                            ? ColorCode.red2
                                            : ColorCode.green))),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        // CustomText(
                        //     text: controller.relationships.firstWhere((element) => element.id==model.),
                        //     textStyle: TextStyles.textMedium18.copyWith(
                        //         fontWeight: FontWeight.w500,
                        //         fontSize: 14,
                        //         color: const Color(ColorCode.textLight))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                CustomText(
                    text: UserLang.payment.tr(),
                    textStyle: TextStyles.textMedium18.copyWith(
                        fontWeight: FontWeight.w700,
                        color: const Color(ColorCode.darkBlue))),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                    child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(ColorCode.white),
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                              color: const Color(ColorCode.whitelight),
                              width: 1)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(AppAssets.masterCard()),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                            text: "Mastercard",
                            textStyle: TextStyles.textMedium18.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: const Color(ColorCode.darkBlack))),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomText(
                            text: "*********",
                            textStyle: TextStyles.textMedium18.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: const Color(ColorCode.darkBlack))),
                      ],
                    ),
                  ],
                ))
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            const Divider(
              height: 1,
              color: Color(ColorCode.dividerColor),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                CustomText(
                    text: UserLang.date.tr(),
                    textStyle: TextStyles.textMedium18.copyWith(
                        fontWeight: FontWeight.w700,
                        color: const Color(ColorCode.darkBlue))),
                const SizedBox(
                  width: 12,
                ),
                CustomText(
                    text: DateFormat("d MMM",AuthService.to.language)
                        .format(DateTime.parse(model.requestDate.toString())),
                    textStyle: TextStyles.textMedium18.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: const Color(ColorCode.dateColor))),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                    text: "${model.umrahPackagePrice.toString()} usd",
                    textStyle: TextStyles.textMedium20.copyWith(
                        fontWeight: FontWeight.w700,
                        color: const Color(ColorCode.primary))),
                const SizedBox(
                  width: 12,
                ),
                // InkWell(
                //   onTap: () {
                //     // Get.rootDelegate.toNamed(UserRoutes.TRACK_ORDER);
                //   },
                //   child: Container(
                //     padding:
                //         const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                //     decoration: BoxDecoration(
                //         color: const Color(ColorCode.pale),
                //         borderRadius: BorderRadius.circular(8)),
                //     child: CustomText(
                //         text: UserLang.reorderAgain.tr(),
                //         textStyle: TextStyles.textMedium18.copyWith(
                //             fontWeight: FontWeight.w500,
                //             fontSize: 14,
                //             color: const Color(ColorCode.onCardColor))),
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
