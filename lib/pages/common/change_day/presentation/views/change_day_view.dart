import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/lang/translation_service.dart';
import 'package:umra/pages/common/signup/presentation/views/widgets/appbar_widget.dart';
import 'package:umra/resources/common_assets.dart';
import 'package:umra/widgets/custom_button.dart';
import 'package:umra/widgets/custom_text.dart';

class ChangeDayView extends StatelessWidget {
  const ChangeDayView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: HomeAppBar(
        height: 100.h,
        child: Padding(
          padding: EdgeInsets.only(left: 24, right: 50, top: 16.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Image.asset(
                    width: 32,
                    height: 32,
                    AppAssets.backArrow(),
                    color: Color(ColorCode.white)),
              ),
              Expanded(
                child: CustomText(
                  text: CommonLang.changeDay.tr(),
                  textStyle: TextStyles.textNormal18.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Color(ColorCode.white)),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color(ColorCode.white),
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 14.h),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 79.h,
                  ),
                  Image.asset(
                    AppAssets.changeDay(),
                    height: 158.62.h,
                    width: 241.w,
                  ),
                  SizedBox(
                    height: 36.38.h,
                  ),
                  SizedBox(
                      height: 60.h,
                      width: 308.w,
                      child: CustomText(
                        text: CommonLang.changeDaySuccess.tr(),
                        textStyle: TextStyles.textButton.copyWith(
                            fontWeight: FontWeight.w700, color: Colors.black),
                        textAlign: TextAlign.center,
                      )),
                  SizedBox(
                    height: 12.h,
                  ),
                  SizedBox(
                      height: 60.h,
                      width: 308.w,
                      child: Text(
                        'your change was sent and we will see the available with the client',
                        textAlign: TextAlign.center,
                        style: TextStyles.textButton.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                            color: Color(ColorCode.fifthGray),
                            height: 1.5.sp),
                      )),
                ],
              ),
            ),
            CustomButton(
                backGroundColor: const Color(ColorCode.appbarGreen),
                child: CustomText(
                  text: CommonLang.goHome.tr(),
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onPressed: () {}
            ),
          ],
        ),
      ),
    );
  }
}
