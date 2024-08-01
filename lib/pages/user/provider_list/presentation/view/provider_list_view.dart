import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/lang/translation_service.dart';
import 'package:umra/lang/user_translation_service.dart';
import 'package:umra/pages/user/provider_list/presentation/controllers/provider_list_controller.dart';
import 'package:umra/pages/user/provider_list/presentation/view/widgets/provider_widget.dart';
import 'package:umra/pages/user/provider_list/presentation/view/widgets/select_date_cell.dart';
import 'package:umra/services/auth_service.dart';
import 'package:umra/widgets/custom_bottom_sheet.dart';
import 'package:umra/widgets/custom_button.dart';
import 'package:umra/widgets/custom_text.dart';

class ProviderListView extends GetView<ProviderListController> {
  const ProviderListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(ColorCode.primary),
        title: Text(UserLang.providerList.tr()),
        centerTitle: true,
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50), child: SelectDateCell()),
      ),
      backgroundColor: const Color(ColorCode.white),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              controller.obx((state) {
                return Expanded(
                  child: controller.searchUmrahPackageRequestModel!.data!.isNotEmpty
                      ? ListView.separated(
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 10.0,
                          ),
                          itemBuilder: (context, index) {
                            return ProviderWidget(
                              index,
                              numOfOrders: controller.searchUmrahPackageRequestModel?.data?[index].providerNoOfOrders.toString() ?? "",
                              country: "Saudi",
                              name: controller.searchUmrahPackageRequestModel?.data?[index].providerAppName.toString() ?? "",
                              rate: controller.searchUmrahPackageRequestModel?.data?[index].providerRate.toString() ??"0",
                              availableDate: controller.searchUmrahPackageRequestModel?.data?[index].availableDate ?? "",
                              imageUrl: "https://media.istockphoto.com/id/476085198/photo/businessman-silhouette-as-avatar-or-default-profile-picture.jpg?s=612x612&w=0&k=20&c=GVYAgYvyLb082gop8rg0XC_wNsu0qupfSLtO7q9wu38=",
                            );
                          },
                          itemCount: controller.searchUmrahPackageRequestModel?.data?.length ?? 0,
                        )
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomText(
                                text: UserLang.noProvidersAvailble.tr(),
                                textStyle: TextStyles.textMedium18.copyWith(
                                  color: const Color(ColorCode.gray4),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16
                                ),
                              ),
                              const SizedBox(height: 10,),
                              CustomButton(
                                onPressed: (){
                                  bool? makeCall = false;
                                  DateTime? reqDate = DateTime.now();
                                  DateTime? endDate = DateTime.now();
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
                                              const SizedBox(
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
                                                  DateTime start = DateTime.parse("${dateRange.startDate}");
                                                  var outputFormat = DateFormat('d MMM',AuthService.to.language);
                                                  if (dateRange.endDate != null) {
                                                    DateTime end =
                                                    DateTime.parse("${dateRange.endDate}");
                                                    endDate = DateTime.parse("${dateRange.endDate}");
                                                    controller.dateRange.value = "${outputFormat.format(start)} - ${outputFormat.format(end)}";
                                                    controller.dateFilter = "${DateFormat('yyyy-MM-dd').format(start)}/${DateFormat('yyyy-MM-dd').format(end)}";

                                                  } else {
                                                    if (controller.dateRange.value != outputFormat.format(start)) {
                                                      makeCall = true;
                                                      reqDate = start;
                                                    }
                                                    controller.dateRange.value = outputFormat.format(start);
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
                                                    print("djklsadhskhdef");
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
                                      )
                                  );
                                },
                                height: 40,
                                width: 150,
                                backGroundColor: const Color(ColorCode.primary),
                                child:  CustomText(
                                  text: UserLang.selectDate.tr(),
                                  textAlign: TextAlign.center,
                                  textStyle: TextStyles.textMedium18.copyWith(
                                      color: const Color(ColorCode.white),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16
                                  ),
                                )
                              ),
                            ],
                          ),
                        ),
                );
              },
                  onLoading: const Expanded(
                    child: SizedBox(
                      child: Center(
                          child:
                              SpinKitCircle(color: Color(ColorCode.primary))),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
