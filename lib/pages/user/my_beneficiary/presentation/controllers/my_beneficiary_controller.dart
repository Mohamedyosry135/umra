import 'package:umra/pages/common/next_signup/model/country_city_response_model.dart';
import 'package:umra/pages/user/my_beneficiary/models/beneficiary_details.dart';
import 'package:umra/pages/user/my_beneficiary/data/my_beneficiary_repository.dart';
import 'package:umra/pages/user/my_beneficiary/models/gender_model_resp.dart';
import 'package:umra/pages/user/my_beneficiary/models/relationships_model_resp.dart';
import 'package:umra/pages/user/user_home/data/user_home_repository.dart';
import 'package:get/get.dart';


class MyBeneficiaryController extends SuperController<bool> {
  MyBeneficiaryController({required this.beneficiaryRepository});
  final IMyBeneficiaryRepository beneficiaryRepository;
  List<BeneficiaryDetails>? beneficiaryDetilsList;
  List<Relatoinship>? relationships;
  List<Gender>? genders;
  List<Countries>? countries;


  @override
  void onInit() async{
    change(false, status: RxStatus.loading());
    await getBeneficiary();
   await  beneficiaryRepository.getCountriesCities().then((value){
      countries = value.countries;
    }).onError((error, stackTrace){
      Get.snackbar("", error.toString());
    });

    await beneficiaryRepository.getGenders().then((value){
      genders = value.genders;
    }).onError((error, stackTrace){
      Get.snackbar("", error.toString());
    });

    await beneficiaryRepository.getRelationships().then((value){
      relationships = value.relationships;
    }).onError((error, stackTrace){
      Get.snackbar("", error.toString());
    });
    change(true, status: RxStatus.success());

    super.onInit();
  }
  getBeneficiary(){
    change(true, status: RxStatus.loading());
    beneficiaryRepository.getAllBeneficiary().then((value){
      beneficiaryDetilsList = value.beneficiaryDetilsList;
      change(true, status: RxStatus.success());

    }).onError((error, stackTrace){
      Get.snackbar("", error.toString());
      Get.back();
      change(false, status: RxStatus.success());

    });
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
