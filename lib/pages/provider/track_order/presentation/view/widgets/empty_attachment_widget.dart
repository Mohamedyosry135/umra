import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/lang/provider_translation_service.dart';
import 'package:umra/pages/provider/track_order/presentation/controllers/provider_track_order_controller.dart';
import 'package:umra/resources/common_assets.dart';
import 'package:umra/shared/enum.dart';
import 'package:umra/widgets/custom_text.dart';

class EmptyAttachmentWidget extends GetView<ProviderTrackOrderController> {
  final int mediaType;
  final int index;
  const EmptyAttachmentWidget({Key? key,required this.mediaType,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        controller.getImage(
          fileType: mediaType  == MediaTypeEnum.record? FileType.audio : mediaType  == MediaTypeEnum.video? FileType.video :  FileType.image,
          index: index
        );
      },
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(21),
        color: const Color(ColorCode.dottedColor),
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              mediaType == MediaTypeEnum.video?AppAssets.uploadVideo() : mediaType == MediaTypeEnum.photo? AppAssets.uploadImage() :  AppAssets.uploadAudio(),
              color: const Color(ColorCode.dottedColor),
              width: 55,
              height: 55,
            ),
            const SizedBox(height: 12,),
            CustomText(
                text: mediaType == MediaTypeEnum.video?ProviderLang.uploadVideo.tr() : mediaType == MediaTypeEnum.photo? ProviderLang.uploadPhoto.tr() :  ProviderLang.uploadAudio.tr(),
                textStyle: TextStyles.textMedium18.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: const Color(ColorCode.dottedColor)
            ))
          ],
        )
      ),
    );
  }
}
