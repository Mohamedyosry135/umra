import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/lang/translation_service.dart';
import 'package:umra/pages/user/provider_list/models/search_providers_list.dart';
import 'package:umra/pages/user/provider_list/presentation/controllers/provider_list_controller.dart';
import 'package:umra/pages/user/provider_list/presentation/view/widgets/provider_info_cell.dart';
import 'package:umra/routes/user_routing/user_app_pages.dart';
import 'package:umra/widgets/custom_button.dart';

class ProviderWidget extends GetView<ProviderListController> {
  final String imageUrl;
  final String name;
  final String country;
  final String numOfOrders;
  final String rate;
  final String availableDate;
  final int index;

  const ProviderWidget(this.index,
      {Key? key,
      required this.imageUrl,
      required this.name,
      required this.country,
      required this.numOfOrders,
      required this.availableDate,
      required this.rate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: const Color(ColorCode.white),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
              color: const Color(ColorCode.gray).withOpacity(.9), width: 2)),
      child: Column(
        children: [
         ProviderInfoCell(
                name: name,
                imageUrl: imageUrl,
                country: country,
                numOfOrders: numOfOrders,
                availableDate : availableDate
                ),

           const SizedBox(
            height: 15,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star,
                    color: Color(ColorCode.starRateColor),
                    size: 20,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    rate,
                    style: const TextStyle(color: Color(ColorCode.textLight)),
                  )
                ],
              ),
              Row(
                children: [
                  CustomButton(
                    onPressed: () {
                      Get.rootDelegate.toNamed(
                        UserRoutes.PROVIDER_DETAILS,
                        arguments: {
                          "providerModel" : controller.searchUmrahPackageRequestModel?.data?[index] ?? ProviderData(),
                          "umrahPackageModel" : controller.umrahPackageModel
                        }
                      );
                    },
                    width: 100,
                    height: 45,
                    backGroundColor: const Color(ColorCode.pale),
                    child: Text(
                      CommonLang.info.tr(),
                      style: TextStyles.textMedium18.copyWith(
                          color: const Color(ColorCode.onCardColor),
                          fontSize: 15),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomButton(
                    onPressed: () {
                      Get.rootDelegate.toNamed(UserRoutes.UMRAH_ADD_REQUEST, arguments: [
                        controller.umrahPackageModel,
                        controller.searchUmrahPackageRequestModel!.data![index]
                      ]);
                    },
                    width: 100,
                    height: 45,
                    backGroundColor: const Color(ColorCode.primary),
                    child: Text(
                      CommonLang.select.tr(),
                      style: TextStyles.textMedium18.copyWith(
                          color: const Color(ColorCode.white), fontSize: 15),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
