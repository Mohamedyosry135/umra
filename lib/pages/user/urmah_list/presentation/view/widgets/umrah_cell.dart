import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/lang/translation_service.dart';
import 'package:umra/lang/user_translation_service.dart';
import 'package:umra/pages/user/urmah_list/models/umra_package_list_model.dart';
import 'package:umra/pages/user/urmah_list/presentation/view/widgets/umrah_description_cell.dart';
import 'package:umra/resources/common_assets.dart';
import 'package:umra/routes/user_routing/user_app_pages.dart';
import 'package:umra/services/auth_service.dart';
import 'package:umra/widgets/custom_button.dart';

class UmrahCell extends StatelessWidget {
  const UmrahCell({Key? key, required this.packageData}) : super(key: key);
  final PackageData packageData;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(ColorCode.cardBackgroundColor),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          PositionedDirectional(
            top: 0.0,
            child: Image.asset(
              AppAssets.decoration(),
              width: 190,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(ColorCode.cardColor),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      AuthService.to.language == "ar"
                          ? packageData.nameAr.toString()
                          : packageData.nameEn.toString(),
                      style: TextStyles.textBold18
                          .copyWith(color: const Color(ColorCode.onCardColor)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                UmrahDescriptionCell(
                    cellTitle: CommonLang.date.tr(),
                    cellValue: '${DateFormat.MMMd(AuthService.to.language).format(
                        DateTime.parse(packageData.dateFrom.toString()))} - ${DateFormat.MMMd(AuthService.to.language).format(
                        DateTime.parse(packageData.dateTo.toString()))}'),
                const SizedBox(
                  height: 15,
                ),
                UmrahDescriptionCell(
                    cellTitle: UserLang.priceUmrah.tr(),
                    cellValue: "${packageData.price.toString()} usd"),
                const SizedBox(
                  height: 15,
                ),
                UmrahDescriptionCell(
                    cellTitle: CommonLang.program.tr(),
                    cellValue:
                        packageData.program!.toString()),
                const SizedBox(
                  height: 25,
                ),
                Center(
                  child: CustomButton(
                    onPressed: () {
                      Get.rootDelegate.toNamed(UserRoutes.PROVIDER_LIST,
                          arguments: packageData);
                    },
                    backGroundColor: const Color(ColorCode.primary),
                    width: 120,
                    child: Text(
                      CommonLang.select.tr(),
                      style: TextStyles.textMedium18
                          .copyWith(color: const Color(ColorCode.white)),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
