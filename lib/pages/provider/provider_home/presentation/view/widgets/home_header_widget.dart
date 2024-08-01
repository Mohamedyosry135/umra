import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/lang/provider_translation_service.dart';
import 'package:umra/lang/translation_service.dart';
import 'package:umra/pages/provider/provider_home/presentation/controller/provider_home_controller.dart';
import 'package:umra/resources/common_assets.dart';
import 'package:umra/widgets/custom_button.dart';
import 'package:umra/widgets/custom_home_widget.dart';
import 'package:umra/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../routes/provider_routing/provider_app_pages.dart';

class HomeProviderHeaderWidget extends GetView<ProviderHomeController> {
  const HomeProviderHeaderWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 35),
          child: CustomHomeWidget(
            onNotificationTap: () {},
            stackContainer: PositionedDirectional(
                bottom: 0.0, end: 0.0, start: 0.0, child: Container()),
          ),
        ),
        controller.obx(
    (snap) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomText(
                      text: ProviderLang.TodayRequests.tr(),
                      textAlign: TextAlign.start,
                      textStyle: TextStyles.textBold18.copyWith(
                          fontSize: 16,
                          color: const Color(ColorCode.greyscale900)),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    CustomText(
                      text: '${controller.myUmraRequestsModel?.data?.length }',
                      textAlign: TextAlign.start,
                      textStyle: TextStyles.textBold18.copyWith(
                          fontSize: 16,
                          color: const Color(ColorCode.greyscale900)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                SizedBox(
                  height: 90,
                  child: PageView.builder(
                    controller: controller.controller,
                    itemCount: controller.myUmraRequestsModel?.data?.length ?? 2,
                    itemBuilder: (_, index) {
                      return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          padding: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 14.w),
                          decoration: BoxDecoration(
                            color: const Color(ColorCode.white),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Row(
                            children: [
                              Image.asset(AppAssets.homephoto(),
                                  width: 65, height: 65, fit: BoxFit.fill),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    start: 12, top: 2),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: controller.myUmraRequestsModel
                                              ?.data?[index].umrahAppUserName ??
                                          '',
                                      textAlign: TextAlign.start,
                                      textStyle: TextStyles.textBold18.copyWith(
                                          fontSize: 16.sp,
                                          color: const Color(
                                              ColorCode.greyscale900)),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                          text: ProviderLang.Date.tr(),
                                          style: TextStyles.textBold18.copyWith(
                                              color: const Color(
                                                  ColorCode.greyscale900),
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w700),
                                          children: [
                                            TextSpan(
                                                text:
                                                    ' ',
                                                style: TextStyles.textNormal18
                                                    .copyWith(
                                                    fontSize: 14.sp,
                                                    fontWeight:
                                                    FontWeight.w600,
                                                    color: const Color(
                                                        ColorCode
                                                            .brownishGrey))),
                                            TextSpan(
                                                text: DateFormat('D MMM ').format(
                                                        DateTime.parse(controller
                                                            .myUmraRequestsModel!
                                                            .data![index]
                                                            .requestDate!)) ,
                                                style: TextStyles.textNormal18
                                                    .copyWith(
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: const Color(
                                                            ColorCode
                                                                .brownishGrey)))
                                          ]),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: CustomButton(
                                  width: 77.w,
                                  height: 32.h,
                                  onPressed: () {
                                    Get.rootDelegate.toNamed(
                                        ProviderRoutes.PROVIDER_TRACK_ORDER,
                                        arguments: {
                                          "id" : controller.myUmraRequestsModel!.data![index].id.toString()
                                        }
                                    );
                                  },
                                  backGroundColor: const Color(ColorCode.primary),
                                  child: CustomText(
                                      text: CommonLang.start.tr(),
                                      textStyle: TextStyles.textNormal18.copyWith(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(ColorCode.white))),
                                ),
                              ),
                            ],
                          ));
                    },
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                // Align(
                //   alignment: Alignment.center,
                //   child: SmoothPageIndicator(
                //     controller: controller.controller,
                //     count: controller.myUmraRequestsModel?.data?.length ?? 3,
                //     effect: const WormEffect(
                //         dotHeight: 5,
                //         dotWidth: 5,
                //         type: WormType.thin,
                //         dotColor: Color(ColorCode.white4),
                //         activeDotColor: Color(ColorCode.primary)),
                //   ),
                // ),
              ],
            ),
          ),
          onLoading: Center(
            child: SpinKitFadingFour(color: Color(ColorCode.primary),),
          ),
          onError: (e) => Text('error')
        ),
      ],
    );
  }
}
