import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umra/lang/translation_service.dart';
import 'package:umra/pages/common/boarding/data/boarding_repository.dart';
import 'package:umra/pages/common/boarding/model.dart';
import 'package:umra/resources/common_assets.dart';
import 'package:umra/services/auth_service.dart';

class BoardingController extends SuperController<bool> {
  BoardingController({required this.boardingRepository});

  final IBoardingRepository boardingRepository;

  RxList<ImageSlider> imageSilders = <ImageSlider>[].obs;
  RxInt currentIndex = 0.obs;
  PageController pageController = PageController(initialPage: 0);
  List<String> languages = ['English',"العربية"];
  String selectedLang = AuthService.to.language == 'en' ? 'English' : "العربية";
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    imageSilders.value.add(ImageSlider(image: AppAssets.board1(),title: CommonLang.pleaseSignIn.tr(),description: CommonLang.enterUrDipstoreAcc.tr()));
    imageSilders.value.add(ImageSlider(image: AppAssets.board2(),title: CommonLang.pleaseSignIn.tr(),description: CommonLang.enterUrDipstoreAcc.tr()));
    imageSilders.value.add(ImageSlider(image: AppAssets.board3(),title: CommonLang.pleaseSignIn.tr(),description: CommonLang.enterUrDipstoreAcc.tr()));

    change(null, status: RxStatus.success());
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
