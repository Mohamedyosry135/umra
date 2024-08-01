import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:umra/pages/provider/my_days/data/my_days_repository.dart';
import 'package:umra/pages/provider/my_days/models/local_date_model.dart';
import 'package:umra/pages/provider/my_days/models/provider_dates_model.dart';
import 'package:umra/pages/provider/my_days/models/umra_package_model.dart';
import 'package:umra/widgets/custom_text_form_field.dart';
import 'package:umra/lang/provider_translation_service.dart';

import '../../../../../consts/colors.dart';
import '../../../../../consts/text_styles.dart';
import '../../../../../routes/common_routing/app_pages.dart';
import '../../../../../widgets/calendar_utils.dart';
import '../../../../../widgets/custom_bottom_sheet.dart';
import '../../../../../widgets/custom_button.dart';
import '../../../../../widgets/custom_drop_down_widget.dart';
import '../../../../../widgets/custom_text.dart';

class MyDaysController extends SuperController<bool> {
  MyDaysController({required this.myDaysRepository});
  final IMyDaysRepository myDaysRepository;
  ProviderDatesModel? providerDatesModel;
  UmraPackageModel? umraPackageModel;
  String? selectedUmraPackage;
  int? selectedUmraPackageId;
  RxList<DateTime> allMonthDays = [DateTime.now()].obs;
  RxBool isSelectAllMonth = false.obs;
  RxBool isSending = false.obs;
  TextEditingController umraCountController = TextEditingController();

  List<LocalDateModel> umraCounts = <LocalDateModel>[];

  DateRangePickerController dateRangePickerController =
      DateRangePickerController();
  int umraPerMonth = 0;
  final Set<DateTime> selectedDays = LinkedHashSet<DateTime>(
    equals: isSameDay,
    hashCode: getHashCode,
  );

  final ValueNotifier<List<Event>> selectedEvents = ValueNotifier([]);
  DateTime focusedDay = DateTime.now();
  initSelections() {
    selectedDays.clear();
    umraCounts.clear();

    providerDatesModel?.data?.dates?.forEach((e) {
      selectedDays.add(DateTime.parse(e.availableDate!));
      umraCounts.add(LocalDateModel(date: e.availableDate, umraCount: e.count));
    });
    print(umraCounts.length);
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    focusedDay = focusedDay;
    // Update values in a Set

    if (selectedDays.contains(selectedDay)) {
      selectedDays.remove(selectedDay);
      umraCounts.removeWhere((element) =>
          element.date == DateFormat('yyyy-MM-dd').format(selectedDay));

      print(DateFormat('yyyy-MM-dd').format(selectedDay));
      print(umraCounts.length);
    } else {
      customBottomSheet(
          bottomSheetBody: GetBuilder<MyDaysController>(
        builder: (snap) => Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CustomText(
                  text:
                      '${ProviderLang.addDay.tr()} ${DateFormat.d().format(selectedDay)} ${DateFormat.MMM().format(selectedDay)}',
                  textStyle: TextStyles.textBold18.copyWith(
                      fontSize: 16, color: const Color(ColorCode.onCardColor)),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 26,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 41.0),
                child: CustomText(
                    text: "${ProviderLang.numUmraPerDay.tr()}",
                    textStyle: TextStyles.textMedium18.copyWith(
                        fontSize: 16,
                        color: const Color(ColorCode.darkGray2),
                        fontWeight: FontWeight.w500)),
              ),
              const SizedBox(
                height: 19,
              ),
              CustomText(
                  text: "${ProviderLang.enterNumOfUmrah.tr()}",
                  textAlign: TextAlign.start,
                  textStyle: TextStyles.textMedium18.copyWith(
                      fontSize: 12,
                      color: const Color(ColorCode.darkGray2),
                      fontWeight: FontWeight.w500)),
              CustomTextFormField(
                hint: '0',
                onSave: (v) {
                  umraPerMonth = int.parse(v!);
                  update();
                },
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                ],
                inputType: TextInputType.phone,
                controller: umraCountController,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomButton(
                onPressed: () {
                  if (umraCountController.text != '0' &&
                      umraCountController.text.isNotEmpty) {
                    umraPerMonth = int.parse(umraCountController.text);
                    selectedDays.add(selectedDay);
                    umraCounts.add(LocalDateModel(
                        date: DateFormat('yyyy-MM-dd').format(selectedDay),
                        umraCount: int.parse(umraCountController.text)));

                    update();
                    Get.back();
                  }
                },
                backGroundColor: const Color(ColorCode.primary),
                child: CustomText(
                  text: "${ProviderLang.add.tr()}",
                  textStyle:
                      TextStyles.textBold18.copyWith(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ));
    }

    selectedEvents.value = getEventsForDays(selectedDays);
    update();
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  List<Event> getEventsForDays(Set<DateTime> days) {
    // Implementation example
    // Note that days are in selection order (same applies to events)
    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  selectAllMonth() {
    DateTime date = DateTime(DateTime.now().year, DateTime.now().month, 1);
    allMonthDays.clear();

    for (int i = 0; i < 31; i++) {
      allMonthDays.add(date.add(Duration(days: i)));
      selectedDays.add(date.add(Duration(days: i)));
      if (umraCounts.any((element) =>
          element.date ==
          DateFormat('yyyy-MM-dd').format(date.add(Duration(days: i))))) {
        print('existed');
      } else {
        umraCounts.add(LocalDateModel(
            date: DateFormat('yyyy-MM-dd').format(date.add(Duration(days: i))),
            umraCount: umraPerMonth));
      }
    }
    dateRangePickerController.selectedDates = allMonthDays;
    update();
    print(umraCounts.length);
  }

  unselectAllMonth() {
    // DateTime date = DateTime(DateTime.now().year, DateTime.now().month, 1);
    allMonthDays.clear();
    selectedDays.clear();
    umraCounts.clear();
    dateRangePickerController.selectedDates = [DateTime.now()];
    update();
  }

  chanePackage() async {
    change(false, status: RxStatus.loading());
    providerDatesModel =
        await myDaysRepository.getProviderAvailbleDates(selectedUmraPackageId!);
    initSelections();
    change(false, status: RxStatus.success());
  }

  sendAvaliableDates() async {
    isSending.value = true;

    if (umraCounts.isNotEmpty && providerDatesModel?.data == null) {
      List<Map> data = [];
      umraCounts.forEach((element) {
        data.add({"availableDate": element.date, "count": element.umraCount});
      });
      print(data.first);
      await myDaysRepository.postProviderUmraDays({
        "id": 0,
        "umrahPackageId": selectedUmraPackageId,
        "dates": jsonEncode(data)
      });

      isSending.value = false;
      Get.rootDelegate.offAndToNamed(Routes.HOME);
    } else if (umraCounts.isNotEmpty && providerDatesModel?.data != null) {
      List<Map> data = [];
      umraCounts.forEach((element) {
        data.add({"availableDate": element.date, "count": element.umraCount});
      });
      print(data.first);

      await myDaysRepository.updateProviderUmraDays(jsonEncode({
        "Id": providerDatesModel?.data?.id,
        "UniqueId": providerDatesModel?.data?.uniqueId,
        "RowVersion": providerDatesModel?.data?.rowVersion,
        "UmrahPackageId": selectedUmraPackageId,
        "UmrahPackageName": providerDatesModel?.data?.umrahPackageName,
        "ProviderAppUserId": providerDatesModel?.data?.providerAppUserId,
        "dates": data
      }));
      isSending.value = false;
      Get.rootDelegate.offAndToNamed(Routes.HOME);
    }
  }

  @override
  Future<void> onInit() async {
    change(false, status: RxStatus.loading());

    umraPackageModel = await myDaysRepository.getProviderUmraPackages();
    selectedUmraPackageId = umraPackageModel?.data?[0].id;
    providerDatesModel =
        await myDaysRepository.getProviderAvailbleDates(selectedUmraPackageId!);
    selectedUmraPackage = umraPackageModel?.data?[0].nameAr;

    initSelections();
    change(false, status: RxStatus.success());

    super.onInit();
  }

  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }
}
