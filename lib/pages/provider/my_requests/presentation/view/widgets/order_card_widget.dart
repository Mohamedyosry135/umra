import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/pages/provider/my_requests/presentation/controllers/my_requests_controller.dart';
import 'package:umra/pages/user/umrah_add_request/models/umra_request_model.dart';
import 'package:umra/widgets/custom_text.dart';

class OrderCardWidget extends GetView<MyOrdersController> {
  UmraRequestData umraRequestData;
  OrderCardWidget(this.umraRequestData, {super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
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
                      CustomText(
                          text: umraRequestData.beneficiaryName ?? "",
                          textStyle: TextStyles.textMedium18.copyWith(
                              fontWeight: FontWeight.w700,
                              color: const Color(ColorCode.darkBlue))),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomText(
                          text: controller.relationships?.where((element) => element.id == umraRequestData.beneficiaryId).isNotEmpty ?? false ? controller.relationships?.firstWhere((element) => element.id == umraRequestData.beneficiaryId).name.toString() ?? "" : "",
                          textStyle: TextStyles.textMedium18.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: const Color(ColorCode.textLight))),
                      CustomText(
                          text: umraRequestData.id.toString() ,
                          textStyle: TextStyles.textMedium18.copyWith(
                              fontWeight: FontWeight.w700,
                              color: const Color(ColorCode.darkBlue))),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  // Container(
                  //   decoration: BoxDecoration(
                  //       color: const Color(ColorCode.white),
                  //       borderRadius: BorderRadius.circular(15.0),
                  //       border: Border.all(
                  //           color: const Color(ColorCode.whitelight),
                  //           width: 1)),
                  //   child: ClipRRect(
                  //     borderRadius: BorderRadius.circular(15.0),
                  //     child: Image.asset(AppAssets.masterCard()),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   width: 12,
                  // ),
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     CustomText(
                  //         text: umraRequestData.beneficiaryId.toString(),
                  //         textStyle: TextStyles.textMedium18.copyWith(
                  //             fontWeight: FontWeight.w600,
                  //             fontSize: 12,
                  //             color: const Color(ColorCode.darkBlack))),
                  //     const SizedBox(
                  //       height: 8,
                  //     ),
                  //     CustomText(
                  //         text: "*********",
                  //         textStyle: TextStyles.textMedium18.copyWith(
                  //             fontWeight: FontWeight.w600,
                  //             fontSize: 12,
                  //             color: const Color(ColorCode.darkBlack))),
                  //   ],
                  // ),
                ],
              ),
              CustomText(
                  text: umraRequestData.umrahPackagePrice.toString(),
                  textStyle: TextStyles.textMedium20.copyWith(
                      fontWeight: FontWeight.w700,
                      color: const Color(ColorCode.primary))),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
