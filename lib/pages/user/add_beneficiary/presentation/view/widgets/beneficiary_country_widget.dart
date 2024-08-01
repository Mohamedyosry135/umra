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

class BeneficiaryCountryWidget extends GetView<AddBeneficiaryController> {
  const BeneficiaryCountryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return BeneficiaryInfoWidget(
        cellValue:  controller.selectedCountry.value == 0 ?controller.residenceCountry.value : controller.countries?.firstWhere((element) => element.id == controller.selectedCountry.value).name ??"",

        cellTitle: CommonLang.residenceCountry.tr(),
        cellWidget: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  CommonLang.residenceCountry.tr(),
                  style: TextStyles.textBold18.copyWith(color: const Color(ColorCode.textLight)),
                ),
              ),
              const SizedBox(height: 10,),

              Expanded(
                child: ListView.separated(
                    itemBuilder: (context,index){
                      return Obx(() => InkWell(
                        onTap: (){
                          controller.onCountrySelect(controller.countries![index].id!);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: const Color(ColorCode.white),
                            border: Border.all(color: controller.isCountrySelected(controller.countries![index].id!).value ? const Color(ColorCode.orangeFaded) :  const Color(ColorCode.gray)),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                controller.countries?[index].name ?? "",
                                style: TextStyles.textMedium18.copyWith(
                                    fontSize: 16,
                                    color:const Color(ColorCode.black)
                                ),
                              ),
                              if(controller.isCountrySelected(controller.countries![index].id!).value)
                                const Icon(
                                  Icons.check_box_rounded,
                                  color: Color(ColorCode.primary),
                                  size: 25,
                                )
                            ],
                          ),
                        ),
                      ));
                    },
                    separatorBuilder: (context,index) => const SizedBox(height: 8,),
                    itemCount: controller.countries?.length ??0
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
      );
    });
  }
}
