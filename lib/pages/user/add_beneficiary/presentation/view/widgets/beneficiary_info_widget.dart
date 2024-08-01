import 'package:flutter/material.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/resources/common_assets.dart';
import 'package:umra/widgets/custom_bottom_sheet.dart';
import 'package:umra/widgets/custom_text.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class BeneficiaryInfoWidget extends StatelessWidget {
  final String cellValue;
  final String cellTitle;
  final Widget cellWidget;
  const BeneficiaryInfoWidget({Key? key,required this.cellValue,required this.cellTitle,required this.cellWidget}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          cellTitle,
          style: TextStyles.textMedium18.copyWith(
              fontSize: 14
          ),
        ),
        const SizedBox(height: 10.0,),
        InkWell(
          onTap: (){
            customBottomSheet(
              backgroundColor: ColorCode.white,
              bottomSheetBody: cellWidget
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(ColorCode.whitelight), width: 1),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                    text: cellValue,
                    textStyle: TextStyles.textMedium18.copyWith(
                        color: const Color(ColorCode.textLight),
                        fontSize: 15
                    )
                ),
                Image.asset(
                  AppAssets.dropDown(),
                  width: 20,
                  height: 20.0,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
