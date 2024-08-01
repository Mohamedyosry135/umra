import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/lang/translation_service.dart';
import 'package:umra/resources/common_assets.dart';
import 'package:umra/widgets/custom_text.dart';

import '../../../../../../routes/common_routing/app_pages.dart';

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({Key? key, required this.profileImage})
      : super(key: key);

  final String profileImage;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.loose,
      children: [
        SizedBox(
          width: double.infinity,
          child: Image.asset(
            AppAssets.profileCover(),
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        PositionedDirectional(
          top: 30,
          start: 5,
          child: InkWell(
            onTap: () {
              
           Get.back();
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(ColorCode.white),
              ),
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: const Icon(
                Icons.arrow_back_rounded,
                color: Color(ColorCode.black),
                size: 20,
              ),
            ),
          ),
        ),
        PositionedDirectional(
          top: 40,
          start: 0,
          end: 0,
          child: CustomText(
            text: CommonLang.yourProfile.tr(),
            textStyle: TextStyles.textMedium18,
          ),
        ),
        PositionedDirectional(
          bottom: -30,
          start: Get.width / 2.6,
          child:
              // Container(
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(15),
              //     border: Border.all(color: const Color(ColorCode.white),width: 4),
              //     color: const Color(ColorCode.white)
              //   ),
              //   height: 80,
              //   width: 80,
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(15),
              //     child: Image.network(
              //       "https://expertphotography.b-cdn.net/wp-content/uploads/2020/08/social-media-profile-photos-3.jpg",
              //       height: 80,
              //       width: 80,
              //       fit: BoxFit.cover,
              //       errorBuilder: (_,err,trace) => Container(
              //         width: 80,
              //         height: 80 ,
              //         color: const Color(ColorCode.background),
              //       ),
              //     ),
              //   ),
              // )
              Container(
            height: 100,
            width: 100,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                shape: BoxShape.rectangle),
            child: profileImage != ""
                ? CachedNetworkImage(
                    imageUrl: profileImage,
                    fit: BoxFit.fill,
                    placeholder: (context, url) => SizedBox(
                        width: 50,
                        height: 50,
                        child:
                            const Center(child: CircularProgressIndicator())),
                    errorWidget: (context, url, error) => SizedBox(
                        width: 100,
                        height: 100,
                        child:
                            const Center(child: CircularProgressIndicator())),
                  )
                : Center(child: CircularProgressIndicator()),
          ),
        ),
      ],
    );
  }
}
