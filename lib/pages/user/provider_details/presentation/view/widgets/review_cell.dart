
import 'package:flutter/material.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/pages/user/provider_details/model/provider_rate_model.dart';

class ReviewCell extends StatelessWidget {
  final RateModel rateModel;
  const ReviewCell({Key? key,required this.rateModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.asset(
            "",
            height: 55,
            width: 55,
            errorBuilder: (_,err,trace){
              return Container(
                height: 55,
                width: 55,
                color: const Color(ColorCode.gray),
              );
            },
          ),
        ),
        const SizedBox(width: 10,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                rateModel.comment ?? "",
                style: TextStyles.textMedium18.copyWith(
                  color: const Color(ColorCode.black),
                  fontSize: 14
                ),
              ),
              const SizedBox(height: 8,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star,
                    color: Color(ColorCode.black),
                    size: 20,
                  ),
                  const SizedBox(width: 5,),
                  Text(
                    rateModel.rate.toString(),
                    style: TextStyles.textBold18.copyWith(
                      color: const Color(ColorCode.black),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(width: 15,),
                  Text(
                    "20 Aug’ 2018",
                    style: TextStyles.textMedium18.copyWith(
                      color: const Color(ColorCode.textLight),
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
