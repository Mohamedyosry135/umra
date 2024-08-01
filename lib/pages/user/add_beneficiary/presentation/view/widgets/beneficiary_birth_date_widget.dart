import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/lang/translation_service.dart';
import 'package:umra/pages/user/add_beneficiary/presentation/controllers/add_beneficiary_controller.dart';
import 'package:umra/pages/user/add_beneficiary/presentation/view/widgets/beneficiary_info_widget.dart';
import 'package:intl/intl.dart';
import 'package:umra/widgets/custom_button.dart';

class BeneficiaryBirthDateWidget extends GetView<AddBeneficiaryController> {
  const BeneficiaryBirthDateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return BeneficiaryInfoWidget(
        cellValue: controller.birthDate.value,
        cellTitle: CommonLang.birthDate.tr(),
        cellWidget: Container(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    CommonLang.birthDate.tr(),
                    style: TextStyles.textBold18.copyWith(color: const Color(ColorCode.textLight)),
                  ),
                ),
                SfDateRangePicker(
                  onSelectionChanged: (date){
                    DateTime dateTime = DateTime.parse("${date.value}");
                    var outputFormat = DateFormat('yyyy-MM-dd');
                    controller.birthDate.value = outputFormat.format(dateTime).toString();
                  },
                  selectionMode: DateRangePickerSelectionMode.single,
                  selectionColor: const Color(ColorCode.orangeFaded),
                  initialSelectedRange: PickerDateRange(
                      DateTime(1920),
                      DateTime.now().add(const Duration(days: 3))
                  ),
                ),
                const SizedBox(height: 10,),
                CustomButton(
                  onPressed: (){
                    Get.back();
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
        ),
      );
    });
  }
}