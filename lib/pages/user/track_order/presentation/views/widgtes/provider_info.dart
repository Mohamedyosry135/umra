import 'package:flutter/material.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/widgets/custom_text.dart';

class ProviderInfo extends StatelessWidget {
  final String providerName;
  const ProviderInfo({Key? key,required this.providerName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      color: const Color(ColorCode.white),
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
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: providerName,
                textStyle: TextStyles.textBold18.copyWith(fontSize: 14),
              ),
              const SizedBox(
                height: 6,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.star,
                    color: Color(ColorCode.starRateColor),
                    size: 20,
                  ),
                  SizedBox(width: 5),
                  CustomText(
                    text: "4.5",
                    textStyle:
                    TextStyle(color: Color(ColorCode.textLight)),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
