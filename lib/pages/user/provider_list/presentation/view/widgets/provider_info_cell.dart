import 'package:flutter/material.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/lang/user_translation_service.dart';

class ProviderInfoCell extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String country;
  final String numOfOrders;
  final String availableDate;
  const ProviderInfoCell({Key? key,required this.imageUrl,required this.name,required this.country,required this.numOfOrders,required this.availableDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
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
                    Text(
                      name,
                      style: TextStyles.textBold18.copyWith(
                          fontSize: 14
                      ),
                    ),
                    const SizedBox(height: 3,),
                    Text(
                      country,
                      style: TextStyles.textMedium18.copyWith(
                          fontSize: 14,
                          color: const Color(ColorCode.primary)
                      ),
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
              ),
            ],
          )
        ),
        Text(
          availableDate,
          style: TextStyles.textMedium18.copyWith(
              fontSize: 14,
              color: const Color(ColorCode.textLight)
          ),
        ),
      ],
    );
  }
}
