import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:umra/consts/colors.dart';
import 'package:umra/lang/translation_service.dart';
import 'package:umra/pages/common/next_signup/model/country_city_response_model.dart';
import 'package:umra/pages/user/add_beneficiary/data/add_beneficiary_repository.dart';
import 'package:umra/pages/user/my_beneficiary/models/gender_model_resp.dart';
import 'package:umra/pages/user/my_beneficiary/models/relationships_model_resp.dart';
import 'package:umra/pages/user/my_beneficiary/presentation/controllers/my_beneficiary_controller.dart';

import '../../../umrah_add_request/presentation/controllers/umrah_add_request_controller.dart';

class AddBeneficiaryController extends SuperController<bool> {
  AddBeneficiaryController({required this.addBeneficiaryRepository});

  final IAddBeneficiaryRepository addBeneficiaryRepository;

  TextEditingController fullNameController = TextEditingController();
  var args;
  List<Relatoinship>? relationships0;
  List<Gender>? genders;
  List<Countries>? countries;
  RxInt selectedGender = 0.obs;
  RxInt selectedRelationship = 0.obs;
  RxInt selectedCountry = 0.obs;

  RxString birthDate = CommonLang.birthDate.tr().obs;
  RxString relationship = CommonLang.relationship.tr().obs;
  RxString residenceCountry = CommonLang.residenceCountry.tr().obs;
    onGenderChange(int id) {
    selectedGender.value = id;
  }

  isGenderSelected(int id) {
    return (id == selectedGender.value).obs;
  }

  onRelationshipSelect(int id) {
    selectedRelationship.value = id;
  }

  isRelationshipSelected(int id) {
    return (id == selectedRelationship.value).obs;
  }

  onCountrySelect(int id) {
    selectedCountry.value = id;
  }

  isCountrySelected(int id) {
    return (id == selectedCountry.value).obs;
  }

  bool? isFromMyBeneficiary;
  @override
  void onInit() {
    change(false, status: RxStatus.loading());
    args = Get.rootDelegate.arguments();
    relationships0 = args[0]['relationships'];
    genders = args[1]['genders'];
    countries = args[2]['countries'];
    isFromMyBeneficiary = args[3]['isFromMyBeneficiary'];
    change(true, status: RxStatus.success());

    super.onInit();
  }

  addBeneficiary() {
    change(false, status: RxStatus.loading());
    if (fullNameController.text.isNotEmpty &&
        birthDate.value != CommonLang.birthDate.tr() &&
        selectedGender.value != 0 &&
        selectedCountry.value != 0 &&
        selectedRelationship.value != 0) {
      addBeneficiaryRepository.addBeneficiary(fullNameController.text, selectedGender.value, birthDate.value, selectedRelationship.value, selectedCountry.value ).then((value)async{
        Get.back();
        change(true,status: RxStatus.success());

      }).onError((error, stackTrace){
        Get.snackbar("", error.toString(),backgroundColor: Color(ColorCode.red),colorText: Color(ColorCode.white));

        change(true,status: RxStatus.success());
      });
    } else {
      Get.snackbar("", CommonLang.fillData.tr(),
          backgroundColor: const Color(ColorCode.red),
          colorText: const Color(ColorCode.white));
      change(true,status: RxStatus.success());
    }

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
  @override
  void onClose() {

    print("dks,jnfkl");
    // if(isFromMyBeneficiary!){
    //   myBeneficiaryController.getBeneficiary();
    // }else{
    //   Get.find<UmrahAddRequestController>().getStaticData();
    // }


    super.onClose();
  }
}
