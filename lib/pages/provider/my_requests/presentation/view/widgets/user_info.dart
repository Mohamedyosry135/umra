import 'package:flutter/material.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/widgets/custom_text.dart';

class UserInfoWidget extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String price;
  final String date;
  const UserInfoWidget({Key? key,required this.name,required this.price,required this.imageUrl,required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      color: const Color(ColorCode.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
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
                  child: Image.network(
                    imageUrl,
                    height: 40,
                    width: 40,
                    errorBuilder: (_,err,trace) => Container(
                      height: 40,
                      width: 40,
                      color: const Color(ColorCode.background),
                    ),
                  ),

                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: name,
                    textStyle: TextStyles.textBold18.copyWith(fontSize: 14),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  CustomText(
                    text: "${price} SAR",
                    textStyle: TextStyles.textBold18.copyWith(fontSize: 14,fontWeight: FontWeight.w700,color: Color(ColorCode.primary)),
                  ),
                ],
              )
            ],
          ),
          CustomText(
            text: date,
            textStyle: TextStyles.textBold18.copyWith(fontSize: 14,fontWeight: FontWeight.w500,color: Color(ColorCode.greyscale900)),
          ),
        ],
      ),
    );
  }
}
