import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/shared/enum.dart';
import 'package:umra/widgets/audio_preview_widget.dart';
import 'package:umra/widgets/image_preview_widget.dart';
import 'package:umra/widgets/video_preview_widget.dart';

class AttachmentFileWidget extends StatelessWidget {
  final String filePath;
  final int mediaType;
  final Function() onRemove;
  const AttachmentFileWidget({Key? key,required this.mediaType,required this.filePath,required this.onRemove}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      clipBehavior: Clip.none,
      children: [
        Container(
          // width: Get.width,
          height: 95,
          width: 95,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Color(ColorCode.primary)),
          ),
          child: ClipRRect(
            child: mediaType == MediaTypeEnum.photo? InkWell(
              onTap: (){
                Get.to(ImagePreviewWidget(attachment: filePath,isLocal: true,));
              },
              child: Image.file(
                File(filePath),
                fit: BoxFit.fill,
                height: 95,
                width: 95,
              ),
            ) : InkWell(
              onTap: (){
                if(mediaType == MediaTypeEnum.record)  {
                  Get.to(AudioPreviewWidget(attachment: filePath,isLocal: true,));

                }else{
                  Get.to(VideoPreviewWidget(isLocal: true,attachment: filePath,));
                }
              },
              child: Container(
                height: 95,
                width: 95,
                color: const Color(ColorCode.background),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(ColorCode.black).withOpacity(.2),
                    ),
                    child:  Icon(
                      mediaType == MediaTypeEnum.record ?  Icons.audiotrack_outlined : Icons.play_arrow,
                      color: const Color(ColorCode.white),
                      size: 25,
                    ),
                  ),
                ),
              ),
            )
          ),
        ),
        PositionedDirectional(
          top: -5,
          end: -5,
          child: InkWell(
            onTap: onRemove,
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(ColorCode.red),
              ),
              child: const Icon(
                Icons.close,
                color: Color(ColorCode.white),
                size: 15,
              ),
            ),
          ),
        )
      ],
    );
  }
}
