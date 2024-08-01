import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/lang/provider_translation_service.dart';
import 'package:umra/lang/translation_service.dart';
import 'package:umra/pages/provider/my_days/presentation/controllers/my_days_controller.dart';
import 'package:umra/resources/common_assets.dart';
import 'package:umra/widgets/custom_button.dart';
import 'package:umra/widgets/custom_drop_down_widget.dart';
import 'package:umra/widgets/custom_text.dart';

import '../../../../../widgets/calendar_utils.dart';

class MyDaysView extends GetView<MyDaysController> {
  const MyDaysView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(ColorCode.primary),
        title: Text(ProviderLang.yourAvailableDays.tr()),
        centerTitle: true,
      ),
      backgroundColor: const Color(ColorCode.white),
      body: controller.obx(
          (snap) => SafeArea(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: const Color(
                                        ColorCode.myWalletBackground),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Stack(
                                  children: [
                                    PositionedDirectional(
                                      end: 0.0,
                                      top: 0.0,
                                      child: Image.asset(
                                        AppAssets.decoration(),
                                        width: 190,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(15),
                                      child: Center(
                                        child: CustomText(
                                          text: ProviderLang.yourDaysHint.tr(),
                                          textStyle:
                                              TextStyles.textBold18.copyWith(
                                            color: const Color(
                                                ColorCode.onCardColor),
                                            fontSize: 14,
                                          ),
                                          maxLines: 6,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              GetBuilder<MyDaysController>(
                                builder: (snapshot) =>
                                    CustomDropDownWidget<String?>(
                                        value: controller.selectedUmraPackage,
                                        items: controller
                                            .umraPackageModel!.data!
                                            .map((e) => e.nameAr)
                                            .toList(),
                                        onChange: (String? v) {
                                          controller.isSelectAllMonth.value =
                                              false;
                                          controller.selectedUmraPackage =
                                              v.toString();
                                          controller.selectedUmraPackageId =
                                              controller.umraPackageModel?.data
                                                  ?.firstWhere((element) =>
                                                      element.nameAr ==
                                                      v.toString())
                                                  .id;
                                          print(controller.selectedUmraPackageId);
                                          controller.chanePackage();

                                          controller.update();
                                        }),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Obx(() {
                                return InkWell(
                                  onTap: () {
                                    controller.isSelectAllMonth.value =
                                        !controller.isSelectAllMonth.value;
                                    if (controller.isSelectAllMonth.value) {
                                      controller.selectAllMonth();
                                    } else {
                                      controller.unselectAllMonth();
                                    }
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        controller.isSelectAllMonth.value
                                            ? Icons.check_box_rounded
                                            : Icons
                                                .check_box_outline_blank_rounded,
                                        size: 25,
                                        color: controller.isSelectAllMonth.value
                                            ? const Color(ColorCode.primary)
                                            : const Color(ColorCode.black),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      CustomText(
                                        text: ProviderLang.selectAllMonth.tr(),
                                        textStyle:
                                            TextStyles.textBold18.copyWith(
                                          color: const Color(ColorCode.black),
                                          fontSize: 14,
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }),
                              const SizedBox(
                                height: 15,
                              ),
                              GetBuilder<MyDaysController>(
                                  builder: (snap) => TableCalendar(
                                        focusedDay: controller.focusedDay,
                                        selectedDayPredicate: (day) {
                                          // Use values from Set to mark multiple days as selected
                                          return controller.selectedDays
                                              .contains(day);
                                        },
                                        firstDay: kFirstDay,
                                        lastDay: kLastDay,
                                        headerVisible: false,
                                        calendarFormat: CalendarFormat.month,
                                        onDaySelected: controller.onDaySelected,
                                        calendarBuilders: CalendarBuilders(
                                            selectedBuilder: (context, date,
                                                    today) =>
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(3.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                          ColorCode
                                                              .orangeFaded),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              7),
                                                      border: Border.all(
                                                          color: const Color(
                                                              ColorCode
                                                                  .orangeFaded),
                                                          width: 2),
                                                    ),
                                                    child: Stack(
                                                      children: [
                                                        Center(
                                                          child: Text(
                                                              DateFormat.d()
                                                                  .format(
                                                                      date)),
                                                        ),
                                                        PositionedDirectional(
                                                            bottom: 3,
                                                            start: 5,
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children:
                                                                  List.generate(
                                                                      controller.umraCounts.firstWhere((element) => element.date == DateFormat('yyyy-MM-dd').format(date)).umraCount! <
                                                                              4
                                                                          ? controller
                                                                              .umraCounts
                                                                              .firstWhere((element) => element.date == DateFormat('yyyy-MM-dd').format(date))
                                                                              .umraCount!
                                                                          : 3,
                                                                      (index) => Padding(
                                                                            padding:
                                                                                const EdgeInsets.symmetric(horizontal: 2.0),
                                                                            child:
                                                                                Row(
                                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                                              children: [
                                                                                Container(
                                                                                  width: 5,
                                                                                  height: 5,
                                                                                  decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                                                                                ),
                                                                                if (controller.umraCounts.firstWhere((element) => element.date == DateFormat('yyyy-MM-dd').format(date)).umraCount! >= 4 && index == 2)
                                                                                  Padding(
                                                                                    padding: const EdgeInsets.symmetric(horizontal: 1.0),
                                                                                    child: CustomText(text: '...', textStyle: TextStyles.textSmall.copyWith(color: Colors.red, height: 0.1)),
                                                                                  )
                                                                              ],
                                                                            ),
                                                                          )),
                                                            ))
                                                      ],
                                                    ),
                                                  ),
                                                )),
                                        calendarStyle: CalendarStyle(
                                          isTodayHighlighted: false,
                                          markerSize: 10,
                                          markerDecoration: BoxDecoration(
                                            color: const Color(
                                                ColorCode.orangeFaded),
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            border: Border.all(
                                                color: const Color(
                                                    ColorCode.orangeFaded),
                                                width: 2),
                                          ),
                                          selectedTextStyle: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                          defaultTextStyle: const TextStyle(
                                              fontSize: 10,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                          holidayTextStyle: const TextStyle(
                                              fontSize: 10,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      )),
                            ],
                          ),
                        ),
                      ),
                      Obx(
                        () => CustomButton(
                          onPressed: () {
                            // Get.rootDelegate.toNamed(Routes.ChangeDay);
                            if (controller.umraCounts.isNotEmpty) {
                              controller.sendAvaliableDates();
                            }
                          },
                          backGroundColor: const Color(ColorCode.primary),
                          child: controller.isSending.value == false
                              ? CustomText(
                                  text: CommonLang.done.tr(),
                                  textStyle: TextStyles.textNormal18.copyWith(
                                      color: const Color(ColorCode.white)))
                              : const SpinKitFadingFour(
                                  color: Colors.white,
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          onLoading: const Center(
            child: SpinKitSpinningLines(color: Color(ColorCode.primary)),
          )),
    );
  }
}
