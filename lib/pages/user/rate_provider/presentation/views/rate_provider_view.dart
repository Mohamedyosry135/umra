import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/lang/user_translation_service.dart';
import 'package:umra/pages/user/track_order/presentation/controllers/track_order_controller.dart';
import 'package:umra/widgets/custom_button.dart';
import 'package:umra/widgets/custom_text.dart';
import 'package:umra/widgets/custom_text_field_container.dart';
import 'package:umra/widgets/custom_text_form_field.dart';

class RateProviderView extends GetView<TrackOrderController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(ColorCode.white),
        leading: const SizedBox(),
        elevation: 0,
      ),
      backgroundColor: const Color(ColorCode.white),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    Center(
                      child: CustomText(
                          text: UserLang.rateProvider.tr(),
                          textStyle: TextStyles.textBold25.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                              color: const Color(ColorCode.primary))),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
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
                          height: 60,
                          width: 60,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    CustomText(
                        text: "Ahmed",
                        textStyle: TextStyles.textMedium18.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: const Color(ColorCode.darkBlue))),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: RatingBar(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        unratedColor: const Color(ColorCode.dividerColor),
                        glow: false,
                        glowColor: Colors.transparent,
                        glowRadius: 0,
                        itemSize: 50,
                        itemCount: 5,
                        ratingWidget: RatingWidget(
                          full: const Icon(
                            Icons.star_purple500_outlined,
                            color: Color(ColorCode.gold),
                          ),
                          empty: const Icon(
                            Icons.star_purple500_outlined,
                            color: Color(ColorCode.dividerColor),
                          ),
                          half: const Icon(
                            Icons.star_purple500_outlined,
                            color: Color(ColorCode.dividerColor),
                          ),
                        ),
                        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CustomText(
                        text: "Very Good",
                        textStyle: TextStyles.textBold25.copyWith(
                            fontWeight: FontWeight.w700,
                            color: const Color(ColorCode.darkBlue))),
                    const SizedBox(
                      height: 18,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomText(
                          text: UserLang.wrireUrView.tr(),
                          textStyle: TextStyles.textMedium18.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: const Color(ColorCode.brownishGrey))),
                    ),
                    CustomTextFieldContainer(CustomTextFormField(
                      hint: UserLang.addComments.tr(),
                      onSave: (String? val) {},
                      inputType: TextInputType.multiline,
                      maxLines: 5,
                      controller: controller.commentController,
                    )),
                ],
              ),
                  )),
              CustomButton(
                onPressed: () {
                  // Get.rootDelegate.toNamed(UserRoutes.RATE_PROVIDER);
                },
                backGroundColor: const Color(ColorCode.primary),
                child: Text(
                  UserLang.sendRate.tr(),
                  style: TextStyles.textMedium18
                      .copyWith(color: const Color(ColorCode.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
