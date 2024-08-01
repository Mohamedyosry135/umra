import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/lang/provider_translation_service.dart';
import 'package:umra/lang/translation_service.dart';
import 'package:umra/widgets/custom_button.dart';
import 'package:umra/widgets/custom_text.dart';

class EndUmrahDialog extends StatelessWidget {
  final Function() onCancel;
  final Function() onEnd;
  final String name;
  const EndUmrahDialog({super.key, required this.onCancel,required this.onEnd,required this.name});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius:
          BorderRadius.all(Radius.circular(32.0))),
      contentPadding: EdgeInsets.only(top: 10.0),
      content: Container(
        // width: 260.0,
        height: 150.0,
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color(ColorCode.white),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(text: CommonLang.endUmrah.tr(),
                 textStyle: TextStyles.textMedium18
          .copyWith(color: const Color(ColorCode.brown),
                 fontWeight: FontWeight.w700
                 ),),
            const SizedBox(height: 20,),
            CustomText(text: "${ProviderLang.willEndUmraFor.tr()} $name",
              textStyle: TextStyles.textMedium18
                  .copyWith(color: const Color(ColorCode.fourthGray),
                  fontWeight: FontWeight.w700
              ),),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Expanded(
                child: CustomButton(
                  width: Get.width*.4,

                  onPressed: onCancel,
                  backGroundColor: const Color(ColorCode.pale),
                  child: Text(
                    ProviderLang.cancel.tr(),
                    style: TextStyles.textMedium18
                        .copyWith(color: const Color(ColorCode.termsColor)),
                  ),
                ),
              ),

              SizedBox(width: 16,),
              Expanded(child: CustomButton(
                onPressed: onEnd,
                backGroundColor: const Color(ColorCode.red2),
                width: Get.width*.4,
                child: Text(
                  CommonLang.endUmrah.tr(),
                  style: TextStyles.textMedium18
                      .copyWith(color: const Color(ColorCode.white)),
                ),
              ),),
            ],
          ),
        )
      ],
    );
  }
}
