import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/lang/translation_service.dart';
import 'package:umra/pages/user/add_beneficiary/presentation/controllers/add_beneficiary_controller.dart';
import 'package:umra/pages/user/add_beneficiary/presentation/view/widgets/gender/gender_cell.dart';

class GenderWidget extends GetView<AddBeneficiaryController> {
  const GenderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          CommonLang.gender.tr(),
          style: TextStyles.textMedium18.copyWith(fontSize: 14),
        ),
        SizedBox(
          height: 10.0,
        ),
        Obx(() {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: controller.genders!.map((e) {
              return cardGender(() {
                controller.onGenderChange(e.id!);
              }, controller.isGenderSelected(e.id!).value, e.name ?? "");
            }).toList(),
          );
        })
      ],
    ) ;
  }

  Widget cardGender(var onTap, bool isSelected, String genderName) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: GenderCell(
          isSelected: isSelected,
          genderName: genderName,
        ),
      ),
    );
  }
}
