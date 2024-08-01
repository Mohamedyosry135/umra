import 'package:flutter/material.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';

class BeneficiaryCell extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String relationship;
  const BeneficiaryCell({Key? key,required this.imageUrl,required this.name,required this.relationship}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(ColorCode.white),
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: const Color(ColorCode.gray).withOpacity(.9),width: 2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      height: 60,
                      width: 60,
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
                          fontSize: 16
                        ),
                      ),
                      const SizedBox(height: 8,),
                      Text(
                        relationship,
                        style: TextStyles.textMedium18.copyWith(
                          fontSize: 16,
                          color: const Color(ColorCode.textLight)
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const Icon(
            Icons.keyboard_arrow_right_outlined,
            color: Color(ColorCode.black),
            size: 20,
          )
        ],
      ),
    );
  }
}
