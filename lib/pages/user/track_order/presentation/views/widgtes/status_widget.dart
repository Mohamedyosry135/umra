import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/pages/user/track_order/model/umrah_details_model.dart';
import 'package:umra/pages/user/track_order/presentation/controllers/track_order_controller.dart';
import 'package:umra/resources/common_assets.dart';
import 'package:umra/shared/enum.dart';
import 'package:umra/widgets/custom_text.dart';

class StatusWidget extends GetView<TrackOrderController>{

  final Attachment? attachment;
  final String title;
  final String description;
  final int mediaType;
  const StatusWidget({super.key, this.attachment,required this.title,required this.description,required this.mediaType});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      margin: const EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(21),
          border: Border.all(
              color: const Color(ColorCode.whitelight), width: 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: title,
                  textStyle: TextStyles.textMedium18.copyWith(
                      fontWeight: FontWeight.w600
                  ),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5,),
                CustomText(
                    text: description,
                    textStyle: TextStyles.textMedium18.copyWith(
                        fontWeight: FontWeight.w600,
                        color: const Color(ColorCode.dateColor)
                    ),
                  textAlign: TextAlign.start,

                )
              ],
            ),
          ),
          Container(

            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Stack(
                children: [
                  controller.getAttachmentCell(mediaType,attachment?.filePath ?? ""),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}