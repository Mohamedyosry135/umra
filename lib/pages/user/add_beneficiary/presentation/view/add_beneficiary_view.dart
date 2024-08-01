import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/consts/text_styles.dart';
import 'package:umra/lang/translation_service.dart';
import 'package:umra/lang/user_translation_service.dart';
import 'package:umra/pages/user/add_beneficiary/presentation/controllers/add_beneficiary_controller.dart';
import 'package:umra/pages/user/add_beneficiary/presentation/view/widgets/beneficiary_birth_date_widget.dart';
import 'package:umra/pages/user/add_beneficiary/presentation/view/widgets/beneficiary_country_widget.dart';
import 'package:umra/pages/user/add_beneficiary/presentation/view/widgets/beneficiary_image_cell.dart';
import 'package:umra/pages/user/add_beneficiary/presentation/view/widgets/beneficiary_info_widget.dart';
import 'package:umra/pages/user/add_beneficiary/presentation/view/widgets/beneficiary_relationship_widget.dart';
import 'package:umra/pages/user/add_beneficiary/presentation/view/widgets/gender/gender_widget.dart';
import 'package:umra/routes/common_routing/app_pages.dart';
import 'package:umra/widgets/custom_button.dart';
import 'package:umra/widgets/custom_text_field_container.dart';
import 'package:umra/widgets/custom_text_form_field.dart';
import 'package:intl/intl.dart';

import '../../../umrah_add_request/presentation/controllers/umrah_add_request_controller.dart';

class AddBeneficiaryView extends GetView<AddBeneficiaryController> {
  const AddBeneficiaryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(ColorCode.primary),
        title: Text(UserLang.addBeneficiary.tr()),
        centerTitle: true,
      ),
      backgroundColor: const Color(ColorCode.white),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BeneficiaryImageCell(),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Text(
                        CommonLang.legalName.tr(),
                        style: TextStyles.textMedium18.copyWith(fontSize: 14),
                      ),
                      CustomTextFieldContainer(CustomTextFormField(
                        verticalPadding: 20,
                        hint: CommonLang.legalName.tr(),
                        controller: controller.fullNameController,
                        onSave: (String? val) {},
                        inputType: TextInputType.text,
                      )),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const GenderWidget(),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const BeneficiaryBirthDateWidget(),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const BeneficiaryRelationshipWidget(),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const BeneficiaryCountryWidget(),
                      const SizedBox(
                        height: 30.0,
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: controller.obx(
                    (state) => CustomButton(
                          onPressed: () {
                            // print((controller.fullNameController.text.isEmpty &&
                            //     controller.birthDate.value ==
                            //         CommonLang.birthDate.tr() &&
                            //     controller.selectedGender.value == 0 &&
                            //     controller.selectedCountry.value == 0 &&
                            //     controller.selectedRelationship.value == 0));
                            controller.addBeneficiary();
                          },
                          backGroundColor: const Color(ColorCode.primary),
                          child: Text(
                            CommonLang.add.tr(),
                            style: TextStyles.textMedium18
                                .copyWith(color: const Color(ColorCode.white)),
                          ),
                        ),
                    onLoading:
                        const SpinKitCircle(color: Color(ColorCode.primary))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
