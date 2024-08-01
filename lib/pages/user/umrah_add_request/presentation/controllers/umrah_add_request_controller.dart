import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umra/lang/translation_service.dart';
import 'package:umra/lang/user_translation_service.dart';
import 'package:umra/pages/user/my_beneficiary/data/my_beneficiary_repository.dart';
import 'package:umra/pages/user/my_beneficiary/models/beneficiary_details.dart';
import 'package:umra/pages/user/my_beneficiary/models/relationships_model_resp.dart';
import 'package:umra/pages/user/provider_list/models/search_providers_list.dart';
import 'package:umra/pages/user/umrah_add_request/data/umrah_add_request_repository.dart';
import 'package:umra/pages/user/umrah_add_request/models/static_reason_model.dart';
import 'package:umra/pages/user/umrah_add_request/models/send_umra_request_model.dart';
import 'package:umra/pages/user/umrah_add_request/presentation/view/payment_webview.dart';
import 'package:umra/pages/user/urmah_list/models/umra_package_list_model.dart';
import 'package:umra/routes/common_routing/app_pages.dart';
import 'package:umra/services/auth_service.dart';

import '../../../../../routes/user_routing/user_app_pages.dart';
import '../../../../common/next_signup/model/country_city_response_model.dart';
import '../../../my_beneficiary/bindings/my_beneficiary_binding.dart';
import '../../../my_beneficiary/models/gender_model_resp.dart';
import '../../../my_beneficiary/presentation/controllers/my_beneficiary_controller.dart';
import '../../models/check_promo_code_model.dart';

class UmrahAddRequestController extends SuperController<bool> {
  UmrahAddRequestController({required this.umrahAddRequestRepository, required this.myBeneficiaryRepository});
  final IUmrahAddRequestRepository umrahAddRequestRepository;
  final IMyBeneficiaryRepository myBeneficiaryRepository;

  List<BeneficiaryDetails>? beneficiaryDetilsList;
  List<ReasonData>? staticReasonModel;
  List<Relatoinship>? relationships;
  RxString reasonSelected = UserLang.selectReason.tr().obs;
  RxString schedule = "July".obs;
  RxString birthDate = UserLang.schedule.tr().obs;
  TextEditingController commentController = TextEditingController();
  TextEditingController couponController = TextEditingController();
  ProviderData? providerData;
  PackageData? packageData;
  RxInt selctedBeneficiaryID = 80000.obs;
  RxInt selctedReasonID = 80000.obs;
  ReasonData? selctedReason;
  RxBool toAddLoading = false.obs;
  RxBool promoCodeLoading = false.obs;
  RxBool promoCodeValid = false.obs;
  var paymentMethodId;
  Rx<CheckPromoCodeModel> promoCodeModel = CheckPromoCodeModel().obs;

  BeneficiaryDetails? selctedBeneficiary;

  Future navigateToAdd() async {
    toAddLoading.value = true;
    // MyBeneficiaryBinding().dependencies();
    // await Get.find<MyBeneficiaryController>()
    //     .beneficiaryRepository
    //     .getGenders()
    //     .then((value) {
    //   genders = value.genders;
    // }).catchError((e) {});
    // await Get.find<MyBeneficiaryController>()
    //     .beneficiaryRepository
    //     .getCountriesCities()
    //     .then((value) {
    //   countries = value.countries;
    // }).catchError((e) {});
    // await Get.find<MyBeneficiaryController>()
    //     .beneficiaryRepository
    //     .getRelationships()
    //     .then((value) {
    //   relationships = value.relationships;
    // }).catchError((e) {});
    Get.back();
  await  Get.rootDelegate.toNamed(UserRoutes.ADD_BENEFICIARY, arguments: [
      {"relationships": relationships},
      {"genders": genders},
      {"countries": countries},
    {"isFromMyBeneficiary":false}
    ]).then((value)async{
    await getBeneficiaryOnly();
  });
    toAddLoading.value = false;
  }

  Future checkPromoCode(String code) async {
    promoCodeLoading.value = true;
    try {

          await umrahAddRequestRepository.checkPromoCode(code).then((value){
            Get.snackbar("",CommonLang.couponApplied.tr());
            promoCodeModel.value = value;
          });
      print(promoCodeModel.value.data?.code);
      promoCodeValid.value = true;
    } catch (e) {
      Get.snackbar("",e.toString());
      promoCodeLoading.value = false;
      print(e.toString());
    }
  }
  String oldPrice ="";
  List<Gender>? genders;
  List<Countries>? countries;
  @override
  void onInit() {
    packageData = Get.rootDelegate.arguments()[0];
    providerData = Get.rootDelegate.arguments()[1];

     oldPrice = "${packageData!.price - (promoCodeModel.value.data?.discountValue ?? 0)}";

    getStaticData();
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
  sendRequest() async {
    if (selctedBeneficiary != null &&
        selctedReason != null &&
        paymentMethodId != null) {
      change(true, status: RxStatus.loading());
      SendUmraRequestModel model = SendUmraRequestModel(
          beneficiaryId: selctedBeneficiary!.id,
          umrahAppUserId: AuthService.to.userInfo!.data!.appUsers!.id,
          umrahPackageId: packageData!.id,
          providerAppUserId: providerData!.providerAppUserId,
          comments: commentController.text,
          reason: selctedReason!.id,
          payMethod: paymentMethodId,
          requestDate: providerData!.availableDate,
      );
      await umrahAddRequestRepository.sendUmrahRequest(model).then((value) {
        print(value.data?.paymentUrl);
        if (value.data?.paymentUrl != null) {
          Get.to(() => PaymentWebView(url: value.data?.paymentUrl ?? ''));
        } else {
          Get.snackbar("", "Requset Send Successfuly");
          Get.rootDelegate.backUntil(Routes.HOME);
        }

        change(true, status: RxStatus.success());
      }).onError((error, stackTrace) {
        Get.snackbar("", error.toString());
        change(true, status: RxStatus.success());
      });
    } else {
      Get.snackbar("", "Please Fill All data");
    }
  }

  getStaticData() {
    change(true, status: RxStatus.loading());

    myBeneficiaryRepository.getAllBeneficiary().then((value)async{
        beneficiaryDetilsList = value.beneficiaryDetilsList;


      await myBeneficiaryRepository.getRelationships().then((value){
              relationships = value.relationships;
            }).onError((error, stackTrace) {
              Get.back();
              Get.snackbar("", error.toString());
            });

        await umrahAddRequestRepository.getReasons().then((value) {
          staticReasonModel = value.data;
        }).onError((error, stackTrace) {
          Get.back();
          Get.snackbar("", error.toString());
        });

        await myBeneficiaryRepository.getCountriesCities().then((value){
          countries = value.countries;
        }).onError((error, stackTrace) {
          Get.back();
          Get.snackbar("", error.toString());
        });
        await myBeneficiaryRepository.getGenders().then((value){
          genders = value.genders;
        }).onError((error, stackTrace) {
          Get.back();
          Get.snackbar("", error.toString());
        });
        change(true, status: RxStatus.success());

      }).onError((error, stackTrace) {
        Get.snackbar("", error.toString());
        Get.back();
        change(false, status: RxStatus.success());
      });
    // umrahAddRequestRepository.getAllBeneficiary().then((value) async {
    //   beneficiaryDetilsList = value.beneficiaryDetilsList;
    //   await umrahAddRequestRepository.getRelationships().then((value) {
    //     relationships = value.relationships;
    //   }).onError((error, stackTrace) {
    //     Get.snackbar("", error.toString());
    //   });
    //   await umrahAddRequestRepository.getReasons().then((value) {
    //     staticReasonModel = value.data;
    //   }).onError((error, stackTrace) {
    //     Get.snackbar("", error.toString());
    //   });
    //
    //
    //   change(true, status: RxStatus.success());
    // }).onError((error, stackTrace) {
    //   Get.snackbar("", error.toString());
    //   Get.back();
    //   change(false, status: RxStatus.success());
    // });

  }



  getBeneficiaryOnly(){
    myBeneficiaryRepository.getAllBeneficiary().then((value)async{
      beneficiaryDetilsList = value.beneficiaryDetilsList;
      change(true, status: RxStatus.success());

    }).onError((error, stackTrace) {
      Get.snackbar("", error.toString());
      Get.back();
      change(false, status: RxStatus.success());
    });
  }
}
