import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/lang/translation_service.dart';
import 'package:umra/lang/user_translation_service.dart';
import 'package:umra/pages/user/provider_list/presentation/view/widgets/provider_info_cell.dart';
import 'package:umra/routes/user_routing/user_app_pages.dart';
import 'package:umra/widgets/custom_button.dart';

class ProviderInfoRequestWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String country;
  final String numOfOrders;
  final String availableDate;
  final String rate;

  const ProviderInfoRequestWidget(
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
      padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 20),
      decoration: BoxDecoration(
          color: const Color(ColorCode.white),
          border: Border.all(
              color: const Color(ColorCode.gray).withOpacity(.9), width: 2)),
      child: Row(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(ColorCode.white),
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(color: const Color(ColorCode.gray).withOpacity(.9),width: 2),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.network(
                      imageUrl,
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Row(
                        children: [
                          Text(
                            name,
                            style: TextStyles.textBold18.copyWith(
                                fontSize: 14
                            ),
                          ),
                          const SizedBox(width: 8,),

                          Text(
                            country,
                            style: TextStyles.textMedium18.copyWith(
                                fontSize: 14,
                                color: const Color(ColorCode.primary)
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 3,),
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
                      const SizedBox(height: 3,),
                      Row(
                        children: [
                          Text(
                            UserLang.numOfOrders.tr(),
                            style: TextStyles.textMedium18.copyWith(
                                fontSize: 14,
                                color: const Color(ColorCode.textLight)
                            ),
                          ),
                          SizedBox(width: 5,),
                          Text(
                            numOfOrders,
                            style: TextStyles.textMedium18.copyWith(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Text(
            availableDate,
            style: TextStyles.textMedium18.copyWith(
                fontSize: 14,
                color: const Color(ColorCode.textLight)
            ),
          ),
        ],
      )
    );
  }
}