import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:umra/pages/provider/my_requests/presentation/controllers/my_requests_controller.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/lang/provider_translation_service.dart';
import 'package:umra/lang/translation_service.dart';
import 'package:umra/lang/user_translation_service.dart';
import 'package:umra/pages/provider/my_days/presentation/controllers/my_days_controller.dart';
import 'package:umra/pages/provider/my_requests/presentation/controllers/my_requests_controller.dart';
import 'package:umra/resources/common_assets.dart';
import 'package:umra/routes/common_routing/app_pages.dart';
import 'package:umra/services/auth_service.dart';
import 'package:umra/widgets/custom_bottom_sheet.dart';
import 'package:umra/widgets/custom_button.dart';
import 'package:umra/widgets/custom_text.dart';
import 'package:intl/intl.dart';
class SelectDateWidget extends GetView<MyOrdersController>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 50,
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            CommonLang.selectDate.tr(),
            style: TextStyles.textBold18.copyWith(
                color: Color(ColorCode.primary),
                fontSize: 15
            ),
          ),
          Obx((){
            return InkWell(
              onTap: (){
                customBottomSheet(
                    backgroundColor: ColorCode.white,
                    bottomSheetBody: SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                UserLang.selectDate.tr(),
                                style: TextStyles.textBold18.copyWith(),
                              ),
                            ),
                            SizedBox(height: 5,),
                            Center(
                              child: Text(
                                CommonLang.selectDateHint.tr(),
                                style: TextStyles.textMedium18.copyWith(color: const Color(ColorCode.textLight),fontSize: 16),
                              ),
                            ),
                            SfDateRangePicker(
                              onSelectionChanged: (DateRangePickerSelectionChangedArgs date){
                                PickerDateRange dateRange = date.value;
                                DateTime start = DateTime.parse("${dateRange.startDate}");
                                var outputFormat = DateFormat('d MMM',AuthService.to.language);
                                final DateFormat serverFormater = DateFormat('yyyy-MM-dd');
                                if(dateRange.endDate != null){
                                  DateTime end = DateTime.parse("${dateRange.endDate}");
                                  print(serverFormater.format(start));
                                  controller.dateFilter = "${serverFormater.format(start)}/${serverFormater.format(end)}";
                                  controller.dateRange.value = "${outputFormat.format(start)} - ${outputFormat.format(end)}";
                                }else{
                                  print(serverFormater.format(start));

                                  controller.dateFilter = "${serverFormater.format(start)}";

                                  controller.dateRange.value = outputFormat.format(start);
                                }
                              },
                              selectionMode: DateRangePickerSelectionMode.range,
                              selectionColor: const Color(ColorCode.orangeFaded),
                            ),
                            const SizedBox(height: 10,),
                            CustomButton(
                              onPressed: (){
                                Get.back();

                                print("controller.dateRange.value ${controller.dateRange.value}");
                                if(controller.dateFilter.isEmpty){
                                }else{
                                  controller.getRequests();
                                }
                              },
                              backGroundColor: const Color(ColorCode.primary),
                              child: Text(
                                CommonLang.select.tr(),
                                style: TextStyles.textMedium18.copyWith(color: const Color(ColorCode.white)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                );

              },
              child: Row(
                children: [
                  Text(
                    controller.dateRange.value,
                    style: TextStyles.textBold18.copyWith(
                        fontSize: 15
                    ),
                  ),
                  const SizedBox(width: 5,),
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