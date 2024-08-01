import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/lang/translation_service.dart';
import 'package:umra/lang/user_translation_service.dart';
import 'package:umra/pages/user/provider_list/presentation/controllers/provider_list_controller.dart';
import 'package:umra/resources/common_assets.dart';
import 'package:umra/widgets/custom_bottom_sheet.dart';
import 'package:umra/widgets/custom_button.dart';

class SelectDateCell extends GetView<ProviderListController> {
  SelectDateCell({Key? key}) : super(key: key);
  bool? makeCall = false;
  DateTime? reqDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 50,
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            UserLang.selectDate.tr(),
            style: TextStyles.textBold18
                .copyWith(color: Color(ColorCode.primary), fontSize: 15),
          ),
          Obx(() {
            return InkWell(
              onTap: () {
                customBottomSheet(
                    backgroundColor: ColorCode.white,
                    bottomSheetBody: SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        child: Wrap(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                UserLang.selectDate.tr(),
                                style: TextStyles.textBold18.copyWith(),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Center(
                              child: Text(
                                UserLang.selectDateHint.tr(),
                                style: TextStyles.textMedium18.copyWith(
                                    color: const Color(ColorCode.textLight),
                                    fontSize: 16),
                              ),
                            ),
                            SfDateRangePicker(
                              onSelectionChanged:
                                  (DateRangePickerSelectionChangedArgs date) {
                                PickerDateRange dateRange = date.value;
                                DateTime start =
                                    DateTime.parse("${dateRange.startDate}");
                                var outputFormat = DateFormat('d MMM');
                                if (dateRange.endDate != null) {
                                  DateTime end =
                                      DateTime.parse("${dateRange.endDate}");
                                  controller.dateRange.value =
                                      "${outputFormat.format(start)} - ${outputFormat.format(end)}";
                                   controller.dateFilter = "${DateFormat('yyyy-MM-dd').format(start)}/${DateFormat('yyyy-MM-dd').format(end)}";

                                } else {
                                  if (controller.dateRange.value !=
                                      outputFormat.format(start)) {
                                    makeCall = true;
                                    reqDate = start;
                                  }
                                  controller.dateRange.value =
                                      outputFormat.format(start);
                                  controller.dateFilter = "${DateFormat('yyyy-MM-dd').format(start)}";

                                }
                              },
                              selectionMode: DateRangePickerSelectionMode.range,
                              selectionColor:
                                  const Color(ColorCode.orangeFaded),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomButton(
                              onPressed: () {
                                if (makeCall == true) {
                                  controller.getProvidersList(controller.dateFilter
                                  );
                                }
                                Get.back();
                              },
                              backGroundColor: const Color(ColorCode.primary),
                              child: Text(
                                CommonLang.select.tr(),
                                style: TextStyles.textMedium18.copyWith(
                                    color: const Color(ColorCode.white)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ));
              },
              child: Row(
                children: [
                  Text(
                    controller.dateRange.value,
                    style: TextStyles.textBold18.copyWith(fontSize: 15),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Image.asset(
                    AppAssets.dropDown(),
                    width: 15,
                    height: 15.0,
                  )
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}
