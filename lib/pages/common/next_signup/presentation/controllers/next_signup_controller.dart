import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:umra/flavors/flavor_config.dart';
import 'package:umra/pages/common/next_signup/model/country_city_response_model.dart';
import 'package:umra/resources/common_assets.dart';
import 'package:umra/routes/common_routing/app_pages.dart';

import '../../data/next_signup_repository.dart';

class NextSignupController extends SuperController<bool> {
  NextSignupController({required this.nextsignupRepository});

  final InextsignupRepository nextsignupRepository;

  TextEditingController addressEditController = TextEditingController();
  TextEditingController phoneEditController = TextEditingController();

  CountryCityResponseModel? countryCityResponseModel;
  RxInt currentIndex = 0.obs;

  late String selectedValue;

  Rx<String> selectedCountryPicker = "+20".obs;
  Rx<Countries> selectedCountry = Countries().obs;
  int? selectedCountryId;
  int? selectedCityId;
  Rx<Cities> selectedCity = Cities().obs;
  late String cityValue;
  Map selectmyJson = {"id": '1', "image": "${AppAssets.avatar()}", "name": "2"};
  List<Map> myJson = [
    {"id": '1', "image": "${AppAssets.avatar()}", "name": "2"},
    {"id": '2', "image": "${AppAssets.add()}", "name": "3"},
    {"id": '3', "image": "${AppAssets.backArrow()}", "name": "4"},
    {"id": '4', "image": "${AppAssets.navbar()}", "name": "5"},
    {"id": '5', "image": "${AppAssets.appIcon()}", "name": "1"},
  ];
  String? selected;
  bool? providerType;

  @override
  void onInit() async {
    // TODO: implement onInit
    change(false, status: RxStatus.loading());
    super.onInit();
    print("HERE");
    await nextsignupRepository.getCountriesWithCity().then((value) {
      print("num of count ${value.countries?.length ?? 0}");
      countryCityResponseModel = value;
      selectedCountry.value = value.countries![0];
      selectedCountryId = selectedCountry.value.id;
      selectedCity.value = selectedCountry.value.cities!.first;
      selectedCityId = selectedCity.value.id;
    }).onError((error, stackTrace) {
      Get.snackbar("", error.toString());
      change(true, status: RxStatus.success());
    });

    print(countryCityResponseModel?.countries?.length);
    providerType =
        Get.find<MyFlavorConfig>().appNameEnum == AppNameEnum.provider;
    change(true, status: RxStatus.success());
  }

  onUpdatProfileClicked() {
    change(false, status: RxStatus.loading());
    nextsignupRepository
        .updateProfileUser(selectedCountryId!, selectedCityId!,
            phoneEditController.text, addressEditController.text)
        .then((value) {
      print(value.data?.fullName);
      if (Get.find<MyFlavorConfig>().appNameEnum == AppNameEnum.user) {
        Get.rootDelegate.offNamed(Routes.HOME);
      } else {
        Get.rootDelegate.offNamed(Routes.applyagentView);
      }

      change(true, status: RxStatus.success());
    }, onError: (err) {
      print("ya mosahel ${err}");
      Get.snackbar("", err);
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
